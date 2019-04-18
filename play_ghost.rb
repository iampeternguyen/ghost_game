require_relative ("./lib/game.rb")
require_relative ("./lib/player.rb")

if __FILE__ == $PROGRAM_NAME
  print "How many players? "
  num_of_of_players = gets.chomp.to_i
  players = []
  while players.length < num_of_of_players
    print "Enter Player #{players.length+1}'s name: "
    players << Player.new(gets.chomp)
  end
  game = Game.new(players)
  game.run
end