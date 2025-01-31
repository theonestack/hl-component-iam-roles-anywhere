load('ext/cfndsl/iam_roles_anywhere.rb')

CloudFormation do  
  # trust anchors
  trust_anchors = external_parameters.fetch(:trust_anchors, {})
  trust_anchors.each do |name, properties|
    source = {
      "SourceType": properties['source']['source_type']
    }

    case properties['source']['source_type']
    when 'CERTIFICATE_BUNDLE'
      source_data = {
        "X509CertificateData": FnSub(properties['source']['source_data']['x509_certificate_data'])
      }
      source["SourceData"] = source_data
    end

    RolesAnywhere_TrustAnchor(name) do
      Enabled properties['enabled']
      Name FnSub(properties['name'])
      Source source
    end
  end

  # iam roles
  roles = external_parameters.fetch(:roles, {})
  roles.each do |name, properties|
    IAM_Role(name) do
      AssumeRolePolicyDocument get_iam_roles_anywhere_trust_policy(properties)
      Path '/'
      Policies iam_role_policies(properties['policies'])
    end
  end

  # profiles
  profiles = external_parameters.fetch(:profiles, {})
  profiles.each do |name, properties|
    role_arns = []
    properties['roles'].each do |role|
      role_arns.append(FnGetAtt(role, "Arn"))
    end

    RolesAnywhere_Profile(name) do
      Enabled properties['enabled']
      Name FnSub(properties['name'])
      AcceptRoleSessionName properties['accept_role_session_name']
      DurationSeconds properties['duration_seconds']
      RoleArns role_arns
    end
  end

end
  