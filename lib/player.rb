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
    puts "💥Il t'inflige #{damage} point de dommage💥"
    player.get_damage(damage)
  end 


  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level
  def initialize(name)
    @weapon_level= 1
      super(name)
    @life_point = 100
  end

  def show_state
    puts "❤️❤️❤️❤️#{@name}, tu possèdes #{@life_point} point de vie et possède une arme de #{@weapon_level}"
  end

  def search_weapon
    weapon_power = rand(1..6)
    puts "Bravo tu as trouvé une arme de #{weapon_power}"
    if weapon_power > @weapon_level
      puts" Super je la garde! Je me mets doux"
      @weapon_level = weapon_power
    else weapon_power <= @weapon_level
      puts "La flemme mon gars !!!"
    end
  end
  
  def compute_damage
    rand(1..6) * @weapon_level
  end
  
  def search_health
    random_health = rand(1..6)
    if random_health == 1
      puts"Dommage tu n'a rien trouvé"
    elsif random_health >= 2 && random_health < 6
      puts "Bravo tu as trouvé +50 points de vie"
      if @life_point <= 50
        @life_point = life_point + 50
      else
        @life_point = 100
      end
    else random_health == 6
      puts "Bravo tu as trouvé +80 points de vie"
      if @life_point <= 20
        @life_point = life_point + 80
      else
        @life_point = 100
      end
    end   
  end
end
