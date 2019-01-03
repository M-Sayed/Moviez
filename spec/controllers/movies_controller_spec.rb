require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:user) { FactoryBot.create :user }

  describe "POST #search" do
    context "with valid params" do
      context "logged in user" do
        before(:each) { sign_in user }

        it "returns a success response" do

          post :search, params: { q: 'dark' }
          expect(response).to be_successful
        end
      end

      context "guest user" do
        it "is unauthorized" do
          post :search, params: { q: 'dark' }
          expect(response.status).to eq(302)
        end
      end
    end

    context "with invalid params" do
      context "logged in user" do
        before(:each) { sign_in user }

        it "returns a success response" do
          post :search, params: { q: '' }
          expect(response.status).to eq(302)
        end
      end

      describe "guest user" do
        it "is unauthorized" do
          post :search, params: { q: '' }
          expect(response.status).to eq(302)
        end
      end
    end
  end

  describe "GET #show" do
    context "with valid params" do
      context "logged in user" do
        before(:each) { sign_in user }

        it "returns a success response" do
          get :show, params: { id: 49026 }
          expect(response).to be_successful
        end
      end

      context "guest user" do
        it "is unauthorized" do
          get :show, params: { id: 49026 }
          expect(response.status).to eq(302)
        end
      end
    end
  end


  describe "POST #favorite" do
    context "with valid params" do
      context "logged in user" do
        before(:each) { sign_in user }

        it "returns a success response" do
          post :favorite, params: { format: :json, movie_id: 49026 }
          expect(response).to be_successful
        end
      end

      context "guest user" do
        before(:each) { sign_out user }

        it "is unauthorized" do
          post :favorite, params: { format: :json, movie_id: 49026 }
          expect(response.status).to eq(401)
        end
      end
    end
  end

  describe "POST #unfavorite" do
    context "with valid params" do
      context "logged in user" do
        before(:each) { sign_in user }

        it "returns a success response" do
          post :unfavorite, params: { format: :json, movie_id: 49026 }
          expect(response).to be_successful
        end
      end

      context "guest user" do
        before(:each) { sign_out user }

        it "is unauthorized" do
          post :unfavorite, params: { format: :json, movie_id: 49026 }
          expect(response.status).to eq(401)
        end
      end
    end
  end
end
