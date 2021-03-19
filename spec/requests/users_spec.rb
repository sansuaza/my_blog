require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user_follower) { create :user }
  let(:user_to_follow) { create :user }
  before(:each) { sign_in user_follower }
  describe "Followship requests" do
    let(:params) do
      {
        username: user_to_follow.username
      }
    end

    it "follow an user" do
      post follow_path(username: params[:username])
      expect(response).to have_http_status(302)
      #expect(response).to redirect_to(assigns(:show))
      # Se hace un seguimiento al redireccionamiento que hace
      follow_redirect!
      expect(response).to render_template(:show)
    end

    context 'unfollow an user' do
      before { post follow_path(username: params[:username]) }
      it "unfollow an user" do
        post unfollow_path(username: params[:username])
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(response).to render_template(:show)
      end
    end
  end
end
