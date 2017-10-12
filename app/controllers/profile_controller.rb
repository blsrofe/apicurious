class ProfileController < ApplicationController
  def index
    raw_data = GithubService.new(current_user).get_user
    @starred_repos = GithubService.new(current_user).get_starred_repos
    @all_repos = GithubService.new(current_user).get_all_repos
    @github_user = GithubUser.new(raw_data)
  end
end
