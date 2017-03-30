require 'rails_helper'

describe UsersController do

  let(:user) {User.create(name: "Karl", email: "karl@karl", password: "karl")}

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: user.id }
      expect(response).to have_http_status 200
    end

    it "assigns the user as @user" do
      get :show, { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it "renders the :show template" do
      get :show, { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  # describe "GET #new" do
  #   it "responds with status code 200" do
  #     get :new
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end

  #   it "assigns a new game to @game" do
  #     get :new
  #     expect(assigns(:game)).to be_a_new Game
  #   end

  #   it "renders the :new template" do
  #     get :new
  #     expect(response).to render_template("new")
  #   end
  # end

  # describe "POST #create" do
    # context "when valid params are passed" do
    #   it "responds with status code 302" do
    #     post :create, {game: {user_throw: "rock"}}
    #     expect(response.code).to eq '302'
    #   end

    #   it "creates a new game in the database" do
    #     start = Game.all.count
    #     post :create, {game: {user_throw: "rock"}}
    #     expect(Game.all.count).to be > (start) 
    #   end

    #   it "assigns the newly created game as @game" do
    #     post :create, {game: {user_throw: "rock"}}
    #     expect(assigns(:game)).to be_an_instance_of Game

    #   end

    #   it "sets a notice that the game was successfully created" do
    #     post :create, {game: {user_throw: "rock"}}
    #     expect(flash[:notice]).to eq 'Game was successfully created.'
    #   end

    #   it "redirects to the created game" do
    #     post :create, {game: {user_throw: "rock"}}
    #     expect(response).to redirect_to assigns(:game)
    #   end
    # end

    # context "when invalid params are passed" do
    #   it "responds with status code 422: Unprocessable Entity" do
    #     post :create, { game: { user_throw: "pineapple" } }
    #     expect(response).to have_http_status 422
    #   end

    #   it "does not create a new game in the database" do
    #     start = Game.all.count
    #     post :create, { game: { user_throw: "pineapple" } }
    #     expect(Game.all.count).to eq start
    #   end

    #   it "assigns the unsaved game as @game" do
    #     post :create, { game: { user_throw: "pineapple" } }
    #     expect(assigns(:game)).to be_an_instance_of Game
    #   end

    #   it "renders the :new template" do
    #     post :create, { game: { user_throw: "pineapple" } }
    #     expect(response).to render_template "new"
    #   end
    # end
  # end

end
