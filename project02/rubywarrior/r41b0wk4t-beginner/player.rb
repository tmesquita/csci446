class Player
  @health
  def play_turn(warrior)
    unless warrior.feel.empty?
    	warrior.attack!
    else
    	if warrior.health < 20
    		unless @health > warrior.health
    			warrior.rest!
    		else
    			warrior.walk!
    		end
	    else
		    warrior.walk!
		end
    end
    @health = warrior.health
  end
end
