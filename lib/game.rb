class Game
  attr_reader :dictionary
  attr_accessor :current_player, :prev_player

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @current_player, @prev_player = @player1, @player2

    @fragment = ""
    @dictionary = {}

    File.open(__dir__ + "/dictionary.txt") do |f|
      f.each_line do |line|
        line = line.chomp
        @dictionary[line] = true
      end
    end

  end

  def play_round
    take_turn(@current_player)
  end

  def next_player!
    @current_player, @prev_player = @prev_player, @current_player
  end

  def take_turn(player)
    puts "Current fragment: #{@fragment}"
    puts "Please enter a character"
    char = gets.chomp.downcase
    while char.length != 1
      puts "Invalid input. Please enter only one character"
      char = gets.chomp.downcase
    end
    if valid_play?(char)
      @fragment += char
      next_player!
      play_round
    end
  end

  def valid_play?(string)
    fragment = @fragment+string
    @dictionary.any? do |key, value|
      if key.include?(fragment)
        if @dictionary[fragment]
          puts "game over"
        end

        true
      end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new("1", "2")
  game.play_round
end