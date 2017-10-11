class ProfileController < ApplicationController
  def index
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token 6d15ca545097787ecb21573c68dcf5cd89e46ac0"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/user")

    raw_data = JSON.parse(response.body, symbolize_names: true)

    @member = Member.new(raw_data)
  end
end
