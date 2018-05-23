require 'rails_helper'

describe User, type: :model do
  describe "Validations" do
    it {should belong_to(:users)}
  end
  
end
