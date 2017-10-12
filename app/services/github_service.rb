class GithubService
  def initialize(user)
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_user
    response = @conn.get("/user")
    parse(response)
  end

  def get_starred_repos
    response = @conn.get("/user/starred")
    parse(response)
  end

  def get_all_repos
    response = @conn.get("/user/repos")
    parse(response)
  end

  private
    attr_reader :conn
end
