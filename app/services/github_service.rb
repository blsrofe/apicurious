class GithubService
  def initialize(current_user)
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_user
    response = @conn.get("/user")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_starred_repos
    response = @conn.get("/user/starred")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_repos
    response = @conn.get("/user/repos")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :conn
end
