require_relative ("./lib/game.rb")
require_relative ("./lib/player.rb")

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("Peter")
  player2 = Player.new("Lavender")
  game = Game.new(player1, player2)
  game.run
end