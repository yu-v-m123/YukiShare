# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # def account

  # end

  # def profile_edit
    
  # end

  def profile_update
    if current_user.update(update_params)
      redirect_to profile_user_registration_path
      flash[:notice] = "プロフィールを更新しました"
    else
      render "profile_edit"
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :username, :image, :image_cache, :email, :password, :password_confirmation, :current_password
      ])
  end

  def update_params
    params.permit(:username, :image, :introduction)
  end
  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  # The path used after sign up.

  def after_sign_up_path_for(resource)
    profile_user_registration_path(resource)
  end

  def after_update_path_for(resource)
    account_user_registration_path(resource)
  end

  # The path used after sign up for inactive accounts.
end
