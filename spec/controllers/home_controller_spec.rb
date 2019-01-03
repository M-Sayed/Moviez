require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { FactoryBot.create :user }

  describe "GET #index" do
    context "logged in user" do
      before(:each) { sign_in user }

      it "returns a success response" do
        get :index
        expect(response).to be_successful
      end
    end

    context "guest user" do
      before(:each) { sign_out user }
      
      it "returns a success response" do
        get :index
        expect(response).to be_successful
      end
    end
  end
end
