class AppleDestroysMicrosoft < Gosu::Window
attr_reader :player, :targets
  
  def initialize(window_width, window_height)
    super(window_width,window_height,0)
    set_game_window(self)
    @background_image = background_image "media/pario_background.png"
    @player = Player.new(self)
    @targets_java = 5.times.map {Target_Java.new(self)}
    @targets_explorer = 5.times.map {Target_Explorer.new(self)}
    @targets_windows = 5.times.map {Target_Windows.new(self)}
    @font = Gosu::Font.new(self, 'System', 30)
    @points = 0
  end
  def button_down(id)
    @player.button_down(id)
  end
  
  def update
    @player.update
    @targets_java.each {|target_java| target_java.update}
    @targets_explorer.each {|target_explorer| target_explorer.update}
    @targets_windows.each {|target_windows| target_windows.update}
  end

  def draw
    @player.draw
    @targets_java.each {|target_java| target_java.draw}
    @background_image.draw 0,0,0
    @targets_explorer.each {|target_explorer| target_explorer.draw}
    @targets_windows.each {|target_windows| target_windows.draw}
  end
end