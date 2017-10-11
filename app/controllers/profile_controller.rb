class ProfileController < ApplicationController
  def index
    raw_data = GithubService.new(current_user).get_user
    @repos = GithubService.new(current_user).get_starred_repos
    @github_user = GithubUser.new(raw_data)
  end
end
