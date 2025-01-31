require 'yaml'

describe 'compiled component iam-roles-anywhere' do
  
  context 'cftest' do
    it 'compiles test' do
      expect(system("cfhighlander cftest #{@validate} --tests tests/iam_roles_anywhere.test.yaml")).to be_truthy
    end      
  end
  
  let(:template) { YAML.load_file("#{File.dirname(__FILE__)}/../out/tests/iam_roles_anywhere/iam-roles-anywhere.compiled.yaml") }
  
  context "Resource" do

    
    context "Base2Local" do
      let(:resource) { template["Resources"]["Base2Local"] }

      it "is of type AWS::RolesAnywhere::TrustAnchor" do
          expect(resource["Type"]).to eq("AWS::RolesAnywhere::TrustAnchor")
      end
      
      it "to have property Enabled" do
          expect(resource["Properties"]["Enabled"]).to eq(true)
      end
      
      it "to have property Name" do
          expect(resource["Properties"]["Name"]).to eq({"Fn::Sub"=>"${EnvironmentName}-base2-local"})
      end
      
      it "to have property Source" do
          expect(resource["Properties"]["Source"]).to eq({"SourceType"=>"CERTIFICATE_BUNDLE", "SourceData"=>{"X509CertificateData"=>{"Fn::Sub"=>"{{resolve:ssm:/${EnvironmentName}/iam-roles-anywhere/base2.local}}"}}})
      end
      
    end
    
    context "EngineeringBase2Local" do
      let(:resource) { template["Resources"]["EngineeringBase2Local"] }

      it "is of type AWS::RolesAnywhere::TrustAnchor" do
          expect(resource["Type"]).to eq("AWS::RolesAnywhere::TrustAnchor")
      end
      
      it "to have property Enabled" do
          expect(resource["Properties"]["Enabled"]).to eq(true)
      end
      
      it "to have property Name" do
          expect(resource["Properties"]["Name"]).to eq({"Fn::Sub"=>"${EnvironmentName}-engineering-base2-local"})
      end
      
      it "to have property Source" do
          expect(resource["Properties"]["Source"]).to eq({"SourceType"=>"CERTIFICATE_BUNDLE", "SourceData"=>{"X509CertificateData"=>{"Fn::Sub"=>"-----BEGIN CERTIFICATE-----\nMIIDSzCCAjOgAwIBAgIUeS6b5JBYokYEGxAXqNetHC/eRu8wDQYJKoZIhvcNAQEL\nBQAwFjEUMBIGA1UEAwwLYmFzZTIubG9jYWwwHhcNMjUwMTI4MDIyMzA4WhcNMzUw\nMTI2MDIyMzA4WjAWMRQwEgYDVQQDDAtiYXNlMi5sb2NhbDCCASIwDQYJKoZIhvcN\nAQEBBQADggEPADCCAQoCggEBAKy8Nkn6pRgn4jHJ5hvP304LnkJaSAuFEW2gHteo\nBmR8cfmmDCcEugVoyvvtRpI2dbnf4me5oeagqpHJQO9np6xomRi0Eo2OZMpxot0g\nBkudlQcCV30tSS3ZhY/1bzr7Xv2rfWgPT18KHetdVWPlibP9tdkwS8wqrxDS9Rjw\narr6olWO2P9GjIewfHLJgLhe8WfMr61C22vwq4IA/TzpgIFJnDWPX6GC4jMAivZp\nnh2TCA+IJYNEBMquZPJSa6RVlD/xqMfq3JiC06hpG/VaKp029hEL5e2v6EEwQQcd\nfMX9PWc1KxfGd8Yt+ptg6gx8h1/5wKP3w1/OCVL4dkuKCoECAwEAAaOBkDCBjTAM\nBgNVHRMEBTADAQH/MB0GA1UdDgQWBBS3NiKC1mqDMVBaANZJdmW4xMCfQTBRBgNV\nHSMESjBIgBS3NiKC1mqDMVBaANZJdmW4xMCfQaEapBgwFjEUMBIGA1UEAwwLYmFz\nZTIubG9jYWyCFHkum+SQWKJGBBsQF6jXrRwv3kbvMAsGA1UdDwQEAwIBBjANBgkq\nhkiG9w0BAQsFAAOCAQEAC9FPplk39lRgt8W6yHMEWep19wWPl40eaAEgR98jA27c\nSLrXtaTGMXv+srvctNyK8WRVdxIMqmxEHFMs/sKYuZjXcPt72M8jx0ri1yMTPqrD\nLM8Hp4TnhNGaNOXXm6Us9Xk8AAUdOD0Jhmqo2z7fXlMkn1BAufDiSKxRPG+lipDX\nSkxNBfQeHEt9EjbyTkzgC8qc81Oo6Xx2/TwroBoqqficmmkHiLOUJcw1/+gKOswK\nc/DrYGGXJ1EkzZHCodJ3+HcnxmtvsZzSNbHBjgwUnfBQJX3hKFkSlbjRP8g1ICv1\n9wakMyMmuLDc5CX0pM5i061M5Kz8N1Sc3CQ+u5Tg8w==\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIIDUzCCAjugAwIBAgIQGssWfMUQB6mTT8OcBaqkFzANBgkqhkiG9w0BAQsFADAW\nMRQwEgYDVQQDDAtiYXNlMi5sb2NhbDAeFw0yNTAxMjgwNDI4MDFaFw0yNzA1MDMw\nNDI4MDFaMCIxIDAeBgNVBAMMF2VuZ2luZWVyaW5nLmJhc2UyLmxvY2FsMIIBIjAN\nBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwhPAOuL9TIcgYC85+SEG0Huap9yt\nXCJHu5lc0W79UhdmQTWnXk5OzxmTeIjbUlkk7Uf/uDXI6n+nt5oB+coVWc8Mphic\n1B4g2Bf0hSKGbRkSVzRlSeYUIuRAcYNpP7opoep9Fk7HMaG1ue90bsUcW1DhFxR8\nuJNGpQaC39HFYyIfpwiQlFWirMUtUk4J/+Y3PcIBgSOhLBO3CTMt/N3sIefwRgw5\nXbdNi8K1ko+WS6J81G6fA3hI0GMUcDklY4XdHDX65wA4QOZUWl38Hwyg50j9jCmb\nM5NsUmYh3vqrLwQhMt0leuaUlAbrIrTAzYtMbrQKrA7HXCcB5k+HWyXFAwIDAQAB\no4GQMIGNMAwGA1UdEwQFMAMBAf8wHQYDVR0OBBYEFFsWbeUdQdFEBSvCTGTmfKtD\nzfHIMFEGA1UdIwRKMEiAFLc2IoLWaoMxUFoA1kl2ZbjEwJ9BoRqkGDAWMRQwEgYD\nVQQDDAtiYXNlMi5sb2NhbIIUeS6b5JBYokYEGxAXqNetHC/eRu8wCwYDVR0PBAQD\nAgEGMA0GCSqGSIb3DQEBCwUAA4IBAQAQ2SAYaRFd4TGHukvVhUYYlNeRCfNx7ZBy\n5+UH3kboTN9KHET8XeT/MO7999+UzhgOHfv75ROlouNnM4HXbPdpxyZJthpm19c3\nKKyUs9n7yl1wNmrDYEoIyZu26/u2bFihfgfUTPSVMbhuplW5v/aFUjaasaGvD5vM\nJM6PjWZv87NX1wGsAvStU3qj7Jg6lrCcIqZrgP+Sqcm2CflRytDpembMVDSMyURb\nbV/KfD76WMUoFC0M+Cqiz7CA+Rp5z4iL8PvWwi7661ext3ki4RrAREiY8dr87p8M\nj9SXEb/OyYIUqyavu4a36A/wCsgzMQrm6xMQsNYnIhwsA9Axb1cG\n-----END CERTIFICATE-----\n"}}})
      end
      
    end
    
    context "TestRole" do
      let(:resource) { template["Resources"]["TestRole"] }

      it "is of type AWS::IAM::Role" do
          expect(resource["Type"]).to eq("AWS::IAM::Role")
      end
      
      it "to have property AssumeRolePolicyDocument" do
          expect(resource["Properties"]["AssumeRolePolicyDocument"]).to eq({"Version"=>"2012-10-17", "Statement"=>[{"Effect"=>"Allow", "Principal"=>{"Service"=>"rolesanywhere.amazonaws.com"}, "Action"=>["sts:AssumeRole", "sts:TagSession", "sts:SetSourceIdentity"], "Condition"=>{"StringEquals"=>{"aws:PrincipalTag/x509Subject/CN"=>"user1.engineering.base2.local"}, "ArnEquals"=>{"aws:SourceArn"=>{"Fn::GetAtt"=>["EngineeringBase2Local", "TrustAnchorArn"]}}}}]})
      end
      
      it "to have property Path" do
          expect(resource["Properties"]["Path"]).to eq("/")
      end
      
      it "to have property Policies" do
          expect(resource["Properties"]["Policies"]).to eq([{"PolicyName"=>"s3", "PolicyDocument"=>{"Version"=>"2012-10-17", "Statement"=>[{"Sid"=>"s3", "Action"=>["s3:List*", "s3:Get*"], "Resource"=>["*"], "Effect"=>"Allow"}]}}])
      end
      
    end
    
    context "AnotherTestRole" do
      let(:resource) { template["Resources"]["AnotherTestRole"] }

      it "is of type AWS::IAM::Role" do
          expect(resource["Type"]).to eq("AWS::IAM::Role")
      end
      
      it "to have property AssumeRolePolicyDocument" do
          expect(resource["Properties"]["AssumeRolePolicyDocument"]).to eq({"Version"=>"2012-10-17", "Statement"=>[{"Effect"=>"Allow", "Principal"=>{"Service"=>"rolesanywhere.amazonaws.com"}, "Action"=>["sts:AssumeRole", "sts:TagSession", "sts:SetSourceIdentity"], "Condition"=>{"StringEquals"=>{"aws:PrincipalTag/x509Subject/CN"=>"user1.base2.local"}, "ArnEquals"=>{"aws:SourceArn"=>{"Fn::GetAtt"=>["Base2Local", "TrustAnchorArn"]}}}}]})
      end
      
      it "to have property Path" do
          expect(resource["Properties"]["Path"]).to eq("/")
      end
      
      it "to have property Policies" do
          expect(resource["Properties"]["Policies"]).to eq([{"PolicyName"=>"ec2", "PolicyDocument"=>{"Version"=>"2012-10-17", "Statement"=>[{"Sid"=>"ec2", "Action"=>["ec2:Describe*"], "Resource"=>["*"], "Effect"=>"Allow"}]}}])
      end
      
    end
    
    context "DefaultProfile" do
      let(:resource) { template["Resources"]["DefaultProfile"] }

      it "is of type AWS::RolesAnywhere::Profile" do
          expect(resource["Type"]).to eq("AWS::RolesAnywhere::Profile")
      end
      
      it "to have property Enabled" do
          expect(resource["Properties"]["Enabled"]).to eq(true)
      end
      
      it "to have property Name" do
          expect(resource["Properties"]["Name"]).to eq({"Fn::Sub"=>"${EnvironmentName}-default-profile"})
      end
      
      it "to have property AcceptRoleSessionName" do
          expect(resource["Properties"]["AcceptRoleSessionName"]).to eq(false)
      end
      
      it "to have property DurationSeconds" do
          expect(resource["Properties"]["DurationSeconds"]).to eq(3600)
      end
      
      it "to have property RoleArns" do
          expect(resource["Properties"]["RoleArns"]).to eq([{"Fn::GetAtt"=>["TestRole", "Arn"]}, {"Fn::GetAtt"=>["AnotherTestRole", "Arn"]}])
      end
      
    end
    
  end

end