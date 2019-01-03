require 'rails_helper'

RSpec.describe MovieFavoriteList, type: :model do
  context "Association" do
    it { should belong_to :movie }
    it { should belong_to :favorite_list }
  end

  context "Validation" do
    it { should validate_presence_of :movie }
    it { should validate_presence_of :favorite_list }
    # it { should validate_uniqueness_of(:movie).scoped_to(:favorite_list_id).case_insensitive }
  end
end
