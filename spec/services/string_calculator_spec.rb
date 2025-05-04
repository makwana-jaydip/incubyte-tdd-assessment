require "rails_helper"

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(described_class.add("")).to eq(0)
    end

    it "returns the number itself when a single number is provided" do
      expect(described_class.add("1")).to eq(1)
    end

    it "returns the sum of two numbers separated by a comma" do
      expect(described_class.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple numbers separated by commas" do
      expect(described_class.add("1,2,3")).to eq(6)
      expect(described_class.add("4,5,6,7")).to eq(22)
    end

    it 'returns the sum of numbers separated by a custom delimiter' do
      expect(described_class.add("//;\n1;2")).to eq(3)
      expect(described_class.add("//|\n1|2|3")).to eq(6)
      expect(described_class.add("//sep\n2sep3")).to eq(5)
    end

    it 'raises an exception when negative numbers are included' do
      expect {
        described_class.add("1,-2,3,-4")
      }.to raise_error(RuntimeError, "negative numbers not allowed: -2, -4")
    end
  end
end
