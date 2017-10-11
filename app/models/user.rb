class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user = User.where(uid: auth_info.uid).first
    if !user.nil? && user.oauth_token == auth_info.credentials.token
      user
    elsif !user.nil?
      user.oauth_token = auth_info.credentials.token
      user.save
      user
    else
      User.create(uid: auth_info.uid, name: auth_info.info.name, nickname: auth_info.info.nickname, oauth_token: auth_info.credentials.token)
      user
    end

    # where(uid: auth_info[:uid]).first_or_create do |new_user|
    #   new_user.uid                = auth_info.uid
    #   new_user.name               = auth_info.info.name
    #   new_user.nickname           = auth_info.info.nickname
    #   new_user.oauth_token        = auth_info.credentials.token
    # end
  end
end
