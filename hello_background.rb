
require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = 'Hello Background'
    @background = Gosu::Image.new(self, 'images/country_field.png', false)
  end

  def update
  end

  def needs_redraw?
    !@scene_ready
  end

  def draw
    @scene_ready ||= true
    @background.draw(0, 0, 0)
  end
end

window = GameWindow.new
window.show
