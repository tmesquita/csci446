class Player
  def play_turn(warrior)
    unless warrior.feel.empty?
    	warrior.attack!
    else
    	warrior.walk!
    end
  end
end
