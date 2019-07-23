require 'rails_helper'

RSpec.describe Cuisine, type: :model do
    it "should be uniq" do 
      cuisine = Cuisine.create(name: 'Polonesa')
      cuisine_new = Cuisine.new(name: 'Polonesa')

      expect(cuisine_new).not_to be_valid
    end 

    it "should name exists" do
      cuisine = Cuisine.new
      
      expect(cuisine).not_to be_valid
    end

    it "should created" do
      cuisine = Cuisine.new(name: 'Americana')
      
      expect(cuisine).to be_valid
    end 
end
