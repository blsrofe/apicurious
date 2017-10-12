require "rails_helper"

describe GithubUser do
  it "is instantiated with valid attributes" do
    attrs = {
      name: "Becki Srofe",
      location: "Denver",
      followers: 5,
      following: 2,
      avatar_url: "www.picture.com",
      email: "someone@gmail.com"
    }

    github_user = GithubUser.new(attrs)
    expect(github_user.name).to eq("Becki Srofe")
    expect(github_user.location).to eq("Denver")
    expect(github_user.followers).to eq(5)
    expect(github_user.following).to eq(2)
    expect(github_user.email).to eq("someone@gmail.com")
    expect(github_user.picture_url).to eq("www.picture.com")
  end
end
