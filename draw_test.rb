require 'test_helper.rb'

class DrawTest < Test::Unit::TestCase
  class TestWindow < Gosu::Window
    attr_reader :image
    def initialize
      super(200,200,false)
      @image = Gosu::Image.new(self,"test.png",true)
    end
    
    def draw
      @image.draw(0,0,0)
    end
  end
  def setup
    @window = TestWindow.new
  end
  
  def test_tick_draws_image
    @window.do_tick
    assert_equal @window.image, @window.drawing_events[0].content
  end


end