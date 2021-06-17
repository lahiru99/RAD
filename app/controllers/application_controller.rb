class ApplicationController < ActionController::Base
  before_action :set_user_uuid

  def set_user_uuid
    if cookies[:user_uuid].blank?
      uuid = SecureRandom.uuid
      cookies.permanent[:user_uuid] = uuid
      User.create(user_uuid: uuid)
    else
      User.find_or_create_by(user_uuid: cookies[:user_uuid])
    end
  end
end
