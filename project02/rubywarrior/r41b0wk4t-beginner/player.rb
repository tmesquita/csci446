class Player
  @health
  @@backward = false
  @@charge = false
  @@turn = false

  def play_turn(warrior)
  	if warrior.feel.wall?
  		@@turn = true
  	#elsif warrior.feel(:backward).wall?
  	#	@@backward = false
  	end

    if @@backward
    	unless warrior.feel(:backward).empty?
	    	if warrior.feel(:backward).captive?
	    		warrior.rescue!(:backward)
	    	else
		    	warrior.attack!(:backward)
		    end
    	else
	    	if warrior.health < 20
	    		unless @health > warrior.health
	    			warrior.rest!
	    		else
	    			warrior.walk!(:backward)
	    		end
		    else
			    warrior.walk!(:backward)
			end
    	end
    	
    else
    	if @@turn
    		warrior.pivot!
    		@@turn = false
		elsif !warrior.feel.empty?
	    	if warrior.feel.captive?
	    		warrior.rescue!
	    	else
		    	warrior.attack!
		    end
	    else
	    	if @health > warrior.health
	    		if warrior.health <= 8
	    			warrior.walk!(:backward)
	    		else
	    			warrior.walk!
	    		end
	    	else
	    		if warrior.health < 15
	    			warrior.rest!
	    		else
	    			warrior.walk!
	    		end
	    	end
	    end
	end
    @health = warrior.health
  end
end
