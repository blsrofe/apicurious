require 'rails_helper'

describe "user can see basic profile info" do
  it "after logging in with oauth2" do
    stub_omniauth

    visit root_path
    click_on "Login With GitHub"

    expect(page).to have_css(".profile_pic")
    expect(page).to have_css(".email")
    expect(page).to have_css(".location")
    expect(page).to have_css(".starred")
    expect(page).to have_css(".followers")
    expect(page).to have_css(".following")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider"=>"github",
      "uid"=>24845318,
      "info"=>
        {"nickname"=>"blsrofe",
          "email"=>"blf_23@yahoo.com",
          "name"=>"Becki Srofe",
          "urls"=>{"GitHub"=>"https://github.com/blsrofe", "Blog"=>""}},
      "credentials"=>{"token"=>"c16f34bcde7ff373a441894a563e493f3acde0f0", "expires"=>false}})
  end
end
