require "rails_helper"

RSpec.describe "Routing to pairings", :type => :routing do
  let(:user) {User.create(name: "Karl", email: "karl@karl", password: "karl")}

  it "routes GET /pairings to pairings#index" do
    expect(:get => root_path).to route_to("pairings#index")
  end

  it "routes GET /pairings/1 to pairings#show" do
    expect(:get => "/user/pairings/1").to route_to("pairings#show", :id => "1")
  end

  it "routes GET /pairings/new to pairings#new" do
    expect(:get => "/pairings/new").to route_to("pairings#new")
  end

  it "routes GET /pairings/edit to pairings#edit" do
    expect(:get => "/pairings/edit").to route_to("pairings#edit")
  end

  it "routes POST /pairings to pairings#create" do
    expect(:post => "/pairings").to route_to("pairings#create")
  end

  it "routes PUT /pairings to pairings#update" do
    expect(:put => "/pairings").to route_to("pairings#update")
  end

  it "routes DELETE /pairings/1 to pairings#destroy" do
    expect(:delete => "/pairings/1").to route_to("pairings#destroy", :id => "1")
  end

end
