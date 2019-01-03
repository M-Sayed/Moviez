require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "Association" do
    it { should have_many(:movie_favorite_lists).dependent(:destroy) }
    it { should have_many(:favorite_lists).through(:movie_favorite_lists) }
  end

  context "Validation" do
    it { should validate_presence_of :overview }
    it { should validate_presence_of :title }
    it { should validate_presence_of :movie_id }
  end
end
