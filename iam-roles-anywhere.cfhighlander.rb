CfhighlanderTemplate do
    Name 'iam-roles-anywhere'
    ComponentVersion component_version
    Description "#{component_name} - #{component_version}"

    DependsOn 'lib-iam'
    
    Parameters do
      ComponentParam 'EnvironmentName', 'dev', isGlobal: true
      ComponentParam 'EnvironmentType', 'development', allowedValues: ['development','production'], isGlobal: true
    end
  
  end