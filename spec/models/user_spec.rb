require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }

  context "Associations" do
    it { should have_one(:favorite_list).dependent(:destroy) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_confirmation_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "Invalid scenarios" do
    subject { user }

    describe "with invalid email" do
      before(:each) { user.email = "@ex.com" }

      it { should be_invalid }
    end

    describe "with blank email" do
      before(:each) { user.email = "" }

      it { should be_invalid }
    end

    describe "with blank name" do
      before(:each) { user.name = "" }

      it { should be_invalid }
    end
  end
end
