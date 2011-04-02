class Gun
  attr_reader :player, :game_window, :bullets, :need_more_bullets
  
  def initialize(player)
    @player = player
    @game_window = player.game_window
    @bullets = 10.times.map {Bullet.new(self)}
    @font = Gosu::Font.new(@game_window, 'System', 24)
    @need_more_bullets = false
  end
  
  def button_down(id)
    if id == Gosu::Button::KbSpace
      shoot
    end
  end
  
  def reset
    @bullets.each {|bullet| bullet.reset}
  end
  
  def update
    @bullets.each {|bullet| bullet.update}
    reload
  end
  
  def shoot
    next_bullet.shoot if next_bullet
  end 
  
  def next_bullet
    @bullets.find {|bullet| bullet.available?}
  end
  
  def bullets_left
    @bullets.select {|bullet| bullet.available?}.size
  end
  
  def reload
    if @bullets.select {|bullet| bullet.available?}.size == 0
      @need_more_bullets = true
    end
    if @bullets.select {|bullet| bullet.available?}.size > 0
      @need_more_bullets = false
    end
  end
  
  def draw
    @font.draw("Bullets: #{bullets_left}", 50,500,4)
    @bullets.each {|bullet| bullet.draw}
  end
end
