class ProfileController < ApplicationController
  def index
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token 7e86908de34edf91af62b17712404a3c32702091"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/user")

    @member = JSON.parse(response.body, symbolize_names: true)
  end
end
