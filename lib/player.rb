class Player
  attr_reader :name

  def initialize (name)
    @name=name
  end

  def guess
    puts "#{@name}, please enter a character"
    char = gets.chomp.downcase
    while char.length != 1
      puts "Invalid input. Please enter only one character"
      puts "================="
      char = gets.chomp.downcase
    end
    char
  end

  def alert_invalid_guess
    puts "Does not match word in dictionary. Try again #{@name}."
  end
end