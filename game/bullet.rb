class Bullet
  attr_reader :x, :y, :shot
  
  def initialize(gun)
    @gun = gun
    @game_window = gun.game_window
    @player = gun.player
    @x = -100
    @y = -100
    @icon = Gosu::Image.new(@game_window, "media/safari.png", false)
    @shot = false
  end
  
  def reset
    @shot = false
    @x = -100
    @y = -100
  end
  
  def update
    if @shot == true
      @y = @y - 20
    end
    if @gun.need_more_bullets == true
      reset
    end
  end
  
  def shoot
    @x = @player.x + 50
    @y = @player.y
    @shot = true
  end
  
  def available?
    @shot == false
  end
  
  def hit_target?(target)
    hit = Gosu::distance(center_x, center_y, target.center_x, target.center_y) < 20
    hit
  end
  
  def center_x
    (@x + @icon.width)/2.0
  end
  
  def center_y
    (@y + @icon.height)/2.0
  end
  
  def draw
    @icon.draw(@x, @y, 4)
  end
  
end
