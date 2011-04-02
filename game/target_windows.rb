class Target_Windows
  
  attr_reader :x, :y, :game_window, :alive, :icon
  
  def initialize(game_window)
    @game_window = game_window
    @player = game_window.player
    @icon = Gosu::Image.new(game_window, "media/windows.png", false)
    @x = 10 + rand(@game_window.width)
    @y = 0
    @max_speed = 10
    @min_speed = 1
    @speed = @min_speed + rand(@max_speed - @min_speed)
    @alive = true  
    @lives = 3
  end
  
  
  def update
    check_if_hit
    if alive? and @y > @game_window.height
      @y = 0
      @x = 10 + rand(@game_window.width)
      @speed = @min_speed + rand(@max_speed - @min_speed)
    else
      @y = @y + @speed
    end
    
    if @alive == false
      @x = -200
    end
        if key_pressed? :r
      @alive = true
      @lives = 3
    end
  
  end
  
  def check_if_hit
    if (@alive and @player.gun.bullets.any? {|bullet| bullet.hit_target?(self)})
      @lives = @lives - 1
      if @lives < 0
          @alive = false
      end
    end
  end
  
  def alive?
    @alive == true
  end
  
  def draw
      @icon.draw(@x, @y, 2)
  end
  
  def center_x
    (@x + @icon.width)/2.0
  end
  
  def center_y
    (@y + @icon.height)/2.0
  end
  
end