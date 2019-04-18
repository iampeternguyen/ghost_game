require_relative ("./lib/game.rb")
require_relative ("./lib/player.rb")
require_relative ("./lib/aiplayer.rb")
require_relative ("./lib/dictionary.rb")


if __FILE__ == $PROGRAM_NAME
  puts "Welcome to GHOST!"
  puts "The object of the game is to get your opponent to complete the spelling of a word."
  puts "If the opponent completes a word, then they get a letter. If they spell the word GHOST then they lose."
  puts "The last surviving player is the winner. Let's play!"

  print "How many human players? "
  num_players = gets.chomp.to_i
  players = []
  while players.length < num_players
    print "Enter Player #{players.length+1}'s name: "
    players << Player.new(gets.chomp)
  end

  print "How many computer players? "
  num_cpu_players = gets.chomp.to_i

  dictionary = Dictionary.new
  num_cpu_players.times do |i|
    players << AiPlayer.new("CPU" + i.to_s, dictionary)
  end
  game = Game.new(players.shuffle, dictionary)
  game.run
end