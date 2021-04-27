class Player
  attr_accessor :name, :life_point

  def initialize(name)
    @name       = name.to_s
    @life_point = 10
  end

  def show_state
    puts "❤️❤️❤️❤️#{@name} possède #{@life_point} point de vie!❤️❤️❤️❤️"
  end

  def get_damage(damage_receive)
    @life_point = @life_point - damage_receive

    if @life_point <= 0
      puts""
      puts "Le joueur #{@name} est mort!!!!"
    end
  end

  def attacks(player)
    puts""
    puts "⚔️Ohhhhh voici #{@name} qui envoie valser #{player.name}⚔️"
    damage = compute_damage
    puts "💥Il lui inflige #{damage} point de dommage💥"
    player.get_damage(damage)
  end 


  def compute_damage
    return rand(1..6)
  end

end