class GithubUser
  attr_reader :name,
              :location,
              :followers,
              :following,
              :email,
              :picture_url

  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
    @location = attributes[:location]
    @followers = attributes[:followers]
    @following = attributes[:following]
    @picture_url = attributes[:avatar_url]
  end
end
