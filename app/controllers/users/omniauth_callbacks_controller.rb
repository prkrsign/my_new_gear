# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def twitter
    callback_for(:twitter)
  end

  # infoで必要な情報を抜き出して、userが存在する場合とuserが存在しない場合で処理を分ける
  def callback_for(provider)
    # binding.pry
    info = User.find_oauth(request.env["omniauth.auth"])
    @user = info[:user]
    @sns = info[:sns]

    # userが存在する場合。sign_inした上でrootにリダレクトされる
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else 
      render template: 'devise/registrations/new'
    end
  end

  def failure
    redirect_to(root_path) && return
  end
end
