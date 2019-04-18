class Game
  attr_reader :dictionary
  attr_accessor :current_player, :prev_player

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @current_player, @prev_player = @player1, @player2
    @game_over=false
    @losses = Hash.new(0)
    @fragment = ""
    @dictionary = {}

    File.open(__dir__ + "/dictionary.txt") do |f|
      f.each_line do |line|
        line = line.chomp
        @dictionary[line] = true
      end
    end

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
    puts "#{@player1.name}: #{record(@player1)} || #{@player2.name}: #{record(@player2)}"
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
    next_player! unless game_over?
  end

  def game_over?
    if @losses.any? {|player, losses| losses == 5}
      @game_over = true
      puts "================="
      print_scoreboard
      puts "#{@prev_player.name} WINS! Congratulations!"
      puts "================="

    end
  end

  def round_over?
    if @dictionary[@fragment]
      @losses[@current_player.name] += 1

      puts "================="
      puts "#{@current_player.name} loses the round. #{@fragment} is a word found in the dictionary."
      puts "================="

      @round_over = true
    end
  end

  def next_player!
    @current_player, @prev_player = @prev_player, @current_player
  end

  def take_turn
    input = @current_player.guess
    if valid_play?(input)
      @fragment += input
    else
      @current_player.alert_invalid_guess
      take_turn
    end
  end


  def valid_play?(string)
    fragment = @fragment+string
    @dictionary.any? do |key, value|
      true if key.include?(fragment)
    end
  end

end

