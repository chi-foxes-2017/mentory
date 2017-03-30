require 'rails_helper'

describe PairingsController do

  let!(:user) { User.create!(name: "Karl", email: "karl@karl.com", password: "password") }
  let(:pary) {Pairing.create(mentor_id: user.id, start_time: "3000-03-03 00:00")}

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "when user is logged in" do
      it "responds with status code 200" do
        get :show, { user_id: user.id, id: pary.id }
        expect(response).to have_http_status 200
      end

      it "renders the :show template" do
        get :show, { user_id: user.id, id: pary.id }
        expect(response).to render_template(:show)
      end
    end
  end
end
