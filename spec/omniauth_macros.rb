module OmniauthMacros
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
        "provider"=>"github",
        "uid"=>"24845318",
        "info"=>{
          "nickname"=>"blsrofe",
          "email"=>"blf_23@yahoo.com",
          "name"=>"Becki Srofe",
          "urls"=>{
            "GitHub"=>"https://github.com/blsrofe",
            "Blog"=>""
           },
          },
          "credentials"=>{
            "token"=>ENV["github_user_token"],
            "expires"=>false
          }
        }
      )
  end
end
