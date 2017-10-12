class GithubUser
  attr_reader :name,
              :location,
              :followers,
              :following,
              :email,
              :picture_url,
              :description,
              :login_name

  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
    @location = attributes[:location]
    @followers = attributes[:followers]
    @following = attributes[:following]
    @picture_url = attributes[:avatar_url]
    @description = attributes[:bio]
    @login_name = attributes[:login]
  end
end
