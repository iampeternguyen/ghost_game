require_relative ("./lib/game.rb")
require_relative ("./lib/player.rb")

if __FILE__ == $PROGRAM_NAME
  puts "Welcome to GHOST!"
  puts "The object of the game is to get your opponent to complete the spelling of a word."
  puts "If the opponent completes a word, then they get a letter. If they spell the word GHOST then they lose."
  puts "The last surviving player is the winner. Let's play!"

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