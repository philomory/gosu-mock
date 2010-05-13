require 'test/unit'
require 'gosu_mock'

class GosuMockExample < Test::Unit::TestCase
  class MockWindow < Gosu::Window
    def initialize
      super(200,200,false)
      @image = Gosu::Image.new(self,"picture.png",false)
    end
    def draw
      @image.draw(0,0,0) unless button_down?(5) # I haven't added the constants yet, but they'll come
    end
  end
  
  def test_window_draws_image
    window = MockWindow.new
    window.do_tick
    
    assert_equal "picture.png", window.drawing_events[0].content.filename
  end
  
  def test_window_doesnt_draw_image_when_button_is_pressed
    window = MockWindow.new
    window.user_presses_button(5)
    window.do_tick
    
    assert window.drawing_events.empty?
  end
  
end

