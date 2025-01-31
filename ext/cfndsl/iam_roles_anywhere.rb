def get_iam_roles_anywhere_trust_policy(iam_role)
    trust_policy = {
        "Version": "2012-10-17",
        "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "rolesanywhere.amazonaws.com"
            },
            "Action": [
                "sts:AssumeRole",
                "sts:TagSession",
                "sts:SetSourceIdentity"
            ],
            "Condition": {
                "StringEquals": {
                    "aws:PrincipalTag/x509Subject/CN": iam_role['x509_certificate_subject_cn']
                },
                "ArnEquals": {
                    "aws:SourceArn": FnGetAtt(iam_role['trust_anchor'], "TrustAnchorArn")
                }
            }
        }
        ]
    }
    return trust_policy
end