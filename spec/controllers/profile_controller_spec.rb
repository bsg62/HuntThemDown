require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #settings" do
    it "returns http success" do
      get :settings
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #settings_common" do
    it "returns http success" do
      get :settings_common
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #settings_password" do
    it "returns http success" do
      get :settings_password
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #settings_two_factor" do
    it "returns http success" do
      get :settings_two_factor
      expect(response).to have_http_status(:success)
    end
  end

end
