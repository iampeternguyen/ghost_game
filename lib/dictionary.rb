class Dictionary
  attr_reader :words
  def initialize
    @words = {}
    File.open(__dir__ + "/dictionary.txt") do |f|
      f.each_line do |line|
        line = line.strip
        build_dictionary(@words, line)
      end
    end
  end

  def build_dictionary(hash_location, remaining_string)
    if remaining_string == ""
      hash_location["is_end"] = true
      return true
    else
      hash_location[remaining_string[0]] = {} unless hash_location[remaining_string[0]]
      build_dictionary(hash_location[remaining_string[0]], remaining_string[1..-1])
    end
  end

  def get_hash_location(word)
    loc = @words
    word.each_char do |char|
      return nil unless loc[char]
      loc = loc[char]
    end
    loc
  end
end

if __FILE__ == $PROGRAM_NAME
  dict = Dictionary.new
  p dict.get_hash_location("argleafjlaf")
end