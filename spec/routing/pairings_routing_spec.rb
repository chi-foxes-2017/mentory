require "rails_helper"

RSpec.describe "Routing to pairings", :type => :routing do
  let(:user) {User.create(name: "Karl", email: "karl@karl", password: "karl")}
  let(:pary) {Pairing.create(mentor_id: user.id, start_time: "3000-03-03 00:00")}

  it "routes GET /pairings to pairings#index" do
    expect(:get => "/users/#{user.id}/pairings").to route_to(controller: "pairings", action: "index", user_id: user.id.to_s)
  end

  it "routes GET /pairings/1 to pairings#show" do
    expect(:get => "/users/#{user.id}/pairings/#{pary.id}").to route_to(controller: "pairings", action: "show", user_id: user.id.to_s, :id => pary.id.to_s)
  end

  it "routes GET /pairings/new to pairings#new" do
    expect(:get => "/users/#{user.id}/pairings/new").to route_to(controller: "pairings", action: "new", user_id: user.id.to_s)
  end

  it "routes GET /pairings/edit to pairings#edit" do
    expect(:get => "/users/#{user.id}/pairings/#{pary.id}/edit").to route_to(controller: "pairings", action: "edit", user_id: user.id.to_s, id: pary.id.to_s)
  end

  it "routes POST /pairings to pairings#create" do
    expect(:post => "/users/#{user.id}/pairings").to route_to(controller: "pairings", action: "create", user_id: user.id.to_s)
  end

  it "routes DELETE /pairings/pary.id to pairings#destroy" do
    expect(:delete => "/users/#{user.id}/pairings/#{pary.id}").to route_to(controller: "pairings", action: "destroy", user_id: user.id.to_s, :id => pary.id.to_s)
  end

end
