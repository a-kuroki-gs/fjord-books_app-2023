# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path
    books_path
  end

  def after_sign_out_path
    new_user_session_path
  end
end
