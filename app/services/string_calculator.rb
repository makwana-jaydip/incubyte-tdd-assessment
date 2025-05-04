class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiter = /,|\n/
    if input.start_with?("//")
      delimiter_line, input = input.split("\n", 2)
      delimiter = Regexp.escape(delimiter_line[2..])
    end

    numbers = input.split(/#{delimiter}/).map(&:to_i)
    numbers.sum
  end
end
