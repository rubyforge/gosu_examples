
require 'gosu'

class GameWindow < Gosu::Window
  BACKGROUND = 'images/country_field.png'
  SPRITE = 'images/explosion.png'
  FRAME_DELAY = 10 # ms

  def initialize
    super(800, 600)
    self.caption = 'Hello Animation'
    @background = Gosu::Image.new(self, BACKGROUND, false)

    @animation = Gosu::Image.load_tiles(self, SPRITE, 128, 128, false)
    @explosion_current_frame = 0
  end

  def update
    @explosion_current_frame += 1 if frame_expired?
  end

  def draw
    @background.draw(0, 0, 0)

    image = current_frame
    image.draw(100, 100, 0)
  end

  private

  def current_frame
    @animation[@explosion_current_frame % @animation.size]
  end

  def frame_expired?
    now = Gosu.milliseconds
    @last_frame ||= now
    if (now - @last_frame) > FRAME_DELAY
      @last_frame = now
    end
  end
end

window = GameWindow.new
window.show
