class Player
  attr_reader :x, :y, :game_window, :gun
  
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(game_window, "media/apple.png", false)
    @x = 300    
    @y = 500
    @gun = Gun.new(self)
  end
  
  def center_x
    (@x + @icon.width)/2.0
  end
  
  def center_y
    (@y + @icon.height)/2.0
  end
  
  def button_down(id)
    @gun.button_down(id)
  end
  
  def update
    if key_pressed? :left
      move_left
    end
    if key_pressed? :right
      move_right
    end
    @gun.update
  end

  def move_left
    @x -= 10 if @x > 0
  end

  def move_right
    @x += 10 if @x < @game_window.width - @icon.width
  end

  def draw
    @icon.draw(@x, @y, 3)
    @gun.draw
  end

end