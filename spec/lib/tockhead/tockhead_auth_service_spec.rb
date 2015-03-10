require 'spec_helper'

describe Tockhead::AuthService do 


  it "should return token in response to a correctly composed request" do
     stub_request(:post, "https://tictail.com/oauth/token").
         with(:body => {"client_id"=>"clientid_test", "client_secret"=>"clientsecret_test", "code"=>"authcode_test", "grant_type"=>"authorization_code"}).
         to_return(:status => 200, :body => "{\"access_token\":\"token\"}", :headers => {})
    Tockhead::Settings.config(api_key: "clientid_test" , secret: "clientsecret_test" )
    response = Tockhead::AuthService.fetch_token("authcode_test") 
    expect(response).to eq("token")
  end

  it "should raise an error if the token is invalid" do 
    stub_request(:post, "https://tictail.com/oauth/token").
      with(:body => {"client_id"=>"clientid_test", "client_secret"=>"clientsecret_test", "code"=>"bad_code", "grant_type"=>"authorization_code"}).
         to_return(:status => [401, "Invalid code"])
    Tockhead::Settings.config(api_key: "clientid_test" , secret: "clientsecret_test" )
    expect {Tockhead::AuthService.fetch_token("bad_code")  }.to raise_error("401 Unauthorized")

  end



end