require 'rails_helper'

RSpec.describe FavoriteList, type: :model do
  context "Association" do
    it { should belong_to :user }
    it { should have_many(:movie_favorite_lists).dependent(:destroy) }
    it { should have_many(:movies).through(:movie_favorite_lists) }
  end

  context "Validation" do
    it { should validate_presence_of :user }
  end
end
