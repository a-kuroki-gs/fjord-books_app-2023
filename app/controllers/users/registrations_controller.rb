# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resourse)
    books_path(resourse)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end
