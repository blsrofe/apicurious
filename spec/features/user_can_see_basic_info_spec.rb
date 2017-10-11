require 'rails_helper'

describe "user can see basic profile info" do
  it "is logged in" do
    visit '/'
    click_on "Login With GitHub"
    expect(page).to have_css(".profile_pic")
    expect(page).to have_css(".email")
    expect(page).to have_css(".location")
    expect(page).to have_css(".starred")
    expect(page).to have_css(".followers")
    expect(page).to have_css(".following")
  end
end
