require "rails_helper"
require "spec_helper"

RSpec.describe ReportsController, :focus, :type => :controller do
  let(:user) { create(:user) }

  describe "get reports#index" do

    it "get index" do
      sign_in(user)
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "get report#filter_report" do

    it "when selects filter report of date range if date not present" do
      sign_in(user)
      post :filter_report, params: { filter: 'date_range'}, xhr: true
      expect(response).to have_http_status(:success)
    end

    it "when selects filter report of date range if date is present" do
      sign_in(user)
      post :filter_report, params: { filter: 'date_range',  date: Time.now}, xhr: true
      expect(response).to have_http_status(:success)
    end

    it "when selects daily report of filter" do
      sign_in(user)
      post :filter_report, params: { filter: 'daily',  date: Time.now}, xhr: true
      expect(response).to have_http_status(:success)
    end

    it "when selects monthly report of filter" do
      sign_in(user)
      post :filter_report, params: { filter: 'monthly',  date: Time.now}, xhr: true
      expect(response).to have_http_status(:success)
    end

    it "when selects date range report of filter" do
      sign_in(user)
      post :filter_report, params: { filter: 'date_range',  date: Time.now}, xhr: true
      expect(response).to have_http_status(:success)
    end

  end

end