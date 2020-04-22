require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Josiane")

while player1.life_points > 0 && player2.life_points > 0

  puts ""
  puts ">>>>  Voici l'état de chaque joueur  <<<<"
  puts "      -----------------------------      "

    player1.show_state

  puts "---"

    player2.show_state

  puts "\n\n"

  puts ">>>>  Passons à la phase d'attaque  <<<<"
  puts "      ----------------------------      "

    player1.attacks(player2)

      if player2.life_points <= 0
        break
      end

  puts "-------------->"
  puts ""

    player2.attacks(player1)
end


