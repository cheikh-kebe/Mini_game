require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts"---------------------------------------"
puts"|                                     |"
puts"|       WELCOME FIGHTERS              |"
puts"|                                     |"
puts"---------------------------------------"
puts""
puts"Choose your character name :!!!"
user_player  = gets.chomp.to_s# choix du personnage avec input gets.chomp
human_player = HumanPlayer.new("#{user_player}")#création du human_player a partir de la class HumanPlayer
puts""
puts"Bienvenue a toi mon cher porteur de lumiere : #{user_player.upcase}"
puts"---------------------------------------"
player_1  = Player.new("King dodongo")#création du player_1
player_2  = Player.new("Bongo-Bongo")#création du player 2
puts ""
puts "Voici tes ennemies : #{player_1.name.upcase} LE DINAUSAURE INFERNAL et LE MONSTRE DE L'OMBRE #{player_2.name.upcase}"
puts""
ememies = [player_1, player_2]
puts""
puts" tu vas devoir te battre contre ces deux monstres afin de recuperer le Rubis Goron!!"
puts"---------------------------------------"
puts"|                                     |"
puts"|            LET'S FIGHT              |"
puts"|                                     |"
puts"---------------------------------------"
while human_player.life_point > 0 && player_1.life_point > 0 || player_2.life_point > 0 do#condition tant que les players ont des life_point superieurs a0 alors le jeu continue
  puts""

  human_player.show_state#methode qui affiche les points de vie et le niveau de l'arme
  puts "quelle action souhaites-tu effectuer?

a - Choisir une meilleure arme ?
s - chercher à te soigner ? 

Vite tu devras ensuite attaquer un des deux monstres si tu veux gagner:
0 -#{player_1.name} a #{player_1.life_point}points de vie
1 -#{player_2.name} a #{player_2.life_point}points de vie"

 x = gets.chomp
 print"=>"
 if x == "a"
  human_player.search_weapon
 elsif x == "s"
  human_player.search_health
 elsif x.to_i == 0
  human_player.attacks(player_1)
 elsif x.to_i == 1
  human_player.attacks(player_2)
 else 
  puts"Commande invalide"
 end
 puts""
 puts "It's your enemies turn to strike!!!!"

ememies.each do |enemies| 
  if enemies.life_point > 0 
    enemies.attacks(human_player)
  end
end
end 
puts""
puts""
 if human_player.life_point > 0 
  puts " YOUR ARE THE WINNER"
 else 
  puts"LOOSER... PFFFF"
 end
