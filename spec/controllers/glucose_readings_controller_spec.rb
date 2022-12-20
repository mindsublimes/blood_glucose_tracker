require "rails_helper"
require "spec_helper"

RSpec.describe GlucoseReadingsController, :focus, :type => :controller do
  let(:user) { create(:user) }
  let(:glucose_reading) {create(:glucose_reading, user: user)}

	describe "get glucose_readings#index" do

    it "get index" do
      sign_in(user)
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "get glucose_readings#show" do

    it "return success" do
      sign_in(user)

      get :show, params: { id: glucose_reading.id}, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "get glucose_readings#create" do

    it "return success" do
      sign_in(user)
      post :create, params: { glucose_reading: { blood_reading: 111, reading_time: "2022-12-20 06:01:00.000000000 +0000", measure_unit: "mg/dl"}}, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "get glucose_readings#create" do
    let! (:glucose_readings) do
			4.times.map {create(:glucose_reading, user: user)}
		end

  	it "if glucose_reading greater then 4 records" do
    	sign_in(user)
      post :create, params: { glucose_reading: { blood_reading: 111, reading_time: "2022-12-20 06:01:00.000000000 +0000", measure_unit: "mg/dl"}}, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "get glucose_readings#update" do

    it "return success" do
      sign_in(user)
      put :update, params: {:id => glucose_reading.id, glucose_reading: { blood_reading: 111, reading_time: "2022-12-20 06:01:00.000000000 +0000", measure_unit: "mg/dl"}}
      expect(response).to redirect_to glucose_reading_url(glucose_reading)
    end
  end

  describe "get glucose_readings#destroy" do

    it "return success" do
      sign_in(user)
      delete :destroy, params: { id: glucose_reading.id}, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

end