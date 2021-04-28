require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player_1 = Player.new("Link")
player_2 = Player.new("Ganondorf")


puts "🗣 À ma droite : #{player_1.name}, le porteur de lumiere!!"
puts""
puts "🗣 À ma gauche : #{player_2.name}, le demon venu du village Gérudo!!"
puts""
puts "----------Présentons les deux combattants:----------"
puts "" 
sleep 1
player_1.show_state
puts ""
player_2.show_state
puts ""
puts "" 
sleep 1
while player_1.life_point > 0 && player_2.life_point >0 
  puts"---------------------FIGHT----------------------------"
  puts "Passons à la phase d'attaque:"

  player_1.attacks(player_2)
  if player_2.life_point <= 0
    break
  end

  player_2.attacks(player_1)
  if player_1.life_point > 0 && player_2.life_point >0
    puts""
    puts"-----------------------Voici l'état des joueurs------------------------------"
    player_1.show_state
    puts""
    player_2.show_state
  end
end
