require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:style) }
  end
  describe 'relationships' do
    it { should have_many(:beer_comments) }
    it { should have_many(:comments).through(:beer_comments) }
  end
end
