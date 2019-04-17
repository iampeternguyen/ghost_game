class Game
  attr_reader :dictionary

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @fragment = []
    @dictionary = {}

    File.open(__dir__ + "/dictionary.txt") do |f|
      f.each_line do |line|
        line = line.chomp
        @dictionary[line] = true
      end
    end
  end

  def play_round

  end

  def current_player
  end

  def prev_player
  end

  def next_player!

  end

  def take_turn(player)
  end

  def valid_play?(string)
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new("1", "2")
  p game.dictionary
end