class AiPlayer
  attr_reader :name, :type

  def initialize (name, dictionary)
    @name=name
    @dictionary = dictionary
    @type = "cpu"
  end

  def guess(fragment)
    loc = @dictionary.get_hash_location(fragment)
    input = loc.keys.select {|k| !loc[k]["is_end"]}
    input = input.length == 0 ? loc.keys.sample.to_s : input.sample.to_s

    puts "#{@name} plays the letter #{input}"
    input
  end

  def alert_invalid_guess
    puts "Does not match word in dictionary. Try again #{@name}."
  end
end
