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
    @targets_left = 0
    @live_count_java = @targets_java.select {|target_java| target_java.alive?}.size
    @live_count_explorer = @targets_explorer.select {|target_explorer| target_explorer.alive?}.size
      @live_count_windows = @targets_windows.select {|target_windows| target_windows.alive?}.size
  end
  def button_down(id)
    @player.button_down(id)
  end
  
  def update
    @live_count_java = @targets_java.select {|target_java| target_java.alive?}.size
    @live_count_explorer = @targets_explorer.select {|target_explorer| target_explorer.alive?}.size
    @live_count_windows = @targets_windows.select {|target_windows| target_windows.alive?}.size
    @player.update
    @targets_java.each {|target_java| target_java.update}
    @targets_explorer.each {|target_explorer| target_explorer.update}
    @targets_windows.each {|target_windows| target_windows.update}
    @targets_left = @live_count_java + @live_count_explorer + @live_count_windows
  end

  def draw
    @player.draw
    @targets_java.each {|target_java| target_java.draw}
    @background_image.draw 0,0,0
    @font.draw("Targets left: #{@targets_left}", 0,0,2)
    @targets_explorer.each {|target_explorer| target_explorer.draw}
    @targets_windows.each {|target_windows| target_windows.draw}
  end
end