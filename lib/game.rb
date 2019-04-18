require_relative("dictionary.rb")

class Game
  attr_accessor :current_player, :prev_player

  def initialize(players, dictionary = Dictionary.new)
    @players = players
    @remaining_players = players.clone
    @current_player = @remaining_players[0]
    @game_over=false
    @losses = Hash.new(0)
    @fragment = ""
    @dictionary = dictionary
  end

  def run
    while !@game_over
      start_round
    end
  end

  def start_round
    @round_over = false
    @fragment = ""
    print_scoreboard
    while !@round_over
      play_round
    end
  end

  def print_scoreboard
    puts "SCOREBOARD"
    @players.each_with_index do |player, index|
      if index == 0
        print "|"
      end

      print " #{player.name}: #{record(player)} |"
    end
    print "\n"
  end

  def record(player)
    str = "GHOST"
    length = @losses[player.name] || 0
    str[0...length]
  end

  def play_round
    puts "Current fragment: #{@fragment}"
    take_turn
    round_over?
    next_player!
    player_eliminated?
    game_over?
  end

  def player_eliminated?
    if @losses[@prev_player.name] == 5
      puts "#{@prev_player.name} has been eliminated"
      @remaining_players.slice!(@remaining_players.index(@prev_player))
    end
  end

  def game_over?
    if @remaining_players.length == 1
      @game_over = true
      print_scoreboard
      puts "#{@remaining_players[0].name} wins the game! Congratulations!"
    end
  end

  def round_over?
    if is_word_end?
      @losses[@current_player.name] += 1
      puts "#{@current_player.name} loses the round. #{@fragment} is a word found in the dictionary."
      @round_over = true
    end
  end

  def is_word_end?
    @dictionary.get_hash_location(@fragment)["is_end"]
  end


  def next_player!
    index = (@remaining_players.index(@current_player) + 1) % @remaining_players.length
    @current_player, @prev_player = @remaining_players[index], @current_player
  end

  def take_turn
    if @current_player.type == "cpu"
      input = @current_player.guess(@fragment)
    else
      input = @current_player.guess
    end

    if valid_play?(input)
      @fragment += input
    else
      @current_player.alert_invalid_guess
      take_turn
    end
  end


  def valid_play?(char)
    @dictionary.get_hash_location(@fragment+char)
  end
end

if __FILE__ == $PROGRAM_NAME

end