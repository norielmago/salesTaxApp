require 'rails_helper'
require "#{Rails.root}/app/models/item.rb"
include ItemsHelper

#convert Item model to Class since there's no database and table
RSpec.describe Item, type: :class do

  def generate_items(input_type)
    records = Item.generate_input(input_type)

    computed_record = []
    records.each do |item|
      computed_record.push(compute_tax(item))
    end
     i = Item.new(computed_record)
    return i
  end

  context "checking output for input 1: " do
    it "should output 1.50 total tax" do
      input_id = 1
      result = generate_items(input_id).get_total_tax_price['total_tax'].round(2)
      expect(result).to eq(1.50)
    end

    it "should output 29.83 total price" do
      input_id = 1
      result = generate_items(input_id).get_total_tax_price['total_price'].round(2)
      expect(result).to eq(29.83)
    end
  end

  context "checking output for input 2: " do
    it "should output 7.65 total tax" do
      input_id = 2
      result = generate_items(input_id).get_total_tax_price['total_tax'].round(2)
      expect(result).to eq(7.65)
    end

    it "should output 65.15 total price" do
      input_id = 2
      result = generate_items(input_id).get_total_tax_price['total_price'].round(2)
      expect(result).to eq(65.15)
    end
  end

  context "checking output for input 3: " do
    it "should output 6.70 total tax" do
      input_id = 3
      result = generate_items(input_id).get_total_tax_price['total_tax'].round(2)
      expect(result).to eq(6.70)
    end

    it "should output 74.68 total price" do
      input_id = 3
      result = generate_items(input_id).get_total_tax_price['total_price'].round(2)
      expect(result).to eq(74.68)
    end
  end

end
