class Member
  attr_reader :name,
              :location,
              :followers,
              :following,
              :email

  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
    @location = attributes[:location]
    @followers = attributes[:followers]
    @following = attributes[:following]
  end
end
