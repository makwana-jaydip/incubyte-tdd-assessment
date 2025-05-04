require 'rails_helper'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(described_class.add('')).to eq(0)
    end

    it 'returns the number itself when a single number is provided' do
      expect(described_class.add('1')).to eq(1)
    end

    it 'returns the sum of two numbers separated by a comma' do
      expect(described_class.add('1,2')).to eq(3)
    end
  end
end