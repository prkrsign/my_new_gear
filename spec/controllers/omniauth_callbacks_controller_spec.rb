require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  binding.pry
  before { request.env["omniauth.auth"] = twitter_mock }
  subject { post :callback_for }

  it "oauthが渡ってこない場合エラーになる" do
    request.env["omniauth.auth"] = nil
    expect { subject }.to raise_error("request.env[omniauth.auth]がありません")
  end
end