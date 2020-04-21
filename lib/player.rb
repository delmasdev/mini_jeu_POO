class Player
  attr_accessor :name, :life_points, :rand_nb

  def initialize(name_of_player)
    @name = name_of_player
    @life_points = 10
  end

  def show_state
    puts ">> #{@name} a #{@life_points} points de vie !"
  end

  def gets_damage(nb_of_damage)
    @life_points = @life_points - nb_of_damage

    if @life_points <= 0
      @life_points = 0
      puts "-> XXXXXXXXXX #{@name} a été trucidé(e) XXXXXXXXXX"
    end
  end

  def attacks(player_attacked)
    player1 = @name
    player2 = player_attacked.name

    puts "---> #{player1} attaque #{player2} !!!"

    @rand_nb = 0
    nb_of_damage = rand_nb + compute_damage
    puts "--"
    puts "-> Il/Elle lui inflige #{nb_of_damage} points de domages !"
    puts ""

    return player_attacked.gets_damage(nb_of_damage)
  end

  def compute_damage
    return rand(1..6)
  end
end

#-------------------------------------------------------------------#
#-------------------------------------------------------------------#

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name_of_human)
    @name = name_of_human
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts ">> #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}!"
  end

  def search_weapon
    rand_weapon = rand(1..6)

    puts "--"
    puts "-> Tu as trouvé(e) une arme de niveau #{rand_weapon} !"
    puts ""

    if rand_weapon > @weapon_level
      @weapon_level = rand_weapon

      puts "-> Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "-> M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_health_pack

    rand_health = rand(1..6)

    if rand_health == 1
      puts "--"
      puts "-> Tu n'as rien trouvé... "
      puts ""
    elsif rand_health >= 2 && rand_health <= 5
      puts "-> Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
      if @life_points > 100
        @life_points = 100
      end
    else rand_health == 6
      puts "-> Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if @life_points > 100
        @life_points = 100
      end
    end
  end
end

