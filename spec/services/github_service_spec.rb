require 'rails_helper'

describe GithubService do
  context 'class methods' do
    context "initialize" do
      it "exists" do
        user = User.new(oauth_token: ENV["github_user_token"])
        expect(GithubService.new(user)).to be_a GithubService
      end
    end
  end

  context "instance methods" do
    context "#get_user" do
      user = User.new(oauth_token: ENV["github_user_token"])
      let(:raw_data)  { GithubService.new(user).get_user }

      it "returns a hash of data for that user" do
        # VCR.use_cassette("filter_by_state") do
          expect(raw_data).to be_a Hash
          expect(raw_data).to have_key :name
          expect(raw_data).to have_key :location
          expect(raw_data).to have_key :email
          expect(raw_data).to have_key :followers
          expect(raw_data).to have_key :following
          expect(raw_data).to have_key :avatar_url
      end
    end

    context "#get_starred_repos" do
      user = User.new(oauth_token: ENV["github_user_token"])
      let(:repos)  { GithubService.new(user).get_starred_repos }

      it "returns an array of starred repo hashes" do
        # VCR.use_cassette("filter_by_state") do
          expect(repos).to be_a Array
          expect(repos.count).to eq(3)
      end
    end
  end
end
