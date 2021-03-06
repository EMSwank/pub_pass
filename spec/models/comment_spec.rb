require 'rails_helper'

describe Comment, type: :model do
  describe "Validations" do
    it {should belong_to(:user)}
    it { should have_many(:beer_comments) } 
    it { should have_many(:beers).through(:beer_comments) } 
  end
  
end
