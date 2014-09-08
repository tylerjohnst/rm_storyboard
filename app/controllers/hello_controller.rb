class HelloController < UIViewController
  extend IB

  attr_accessor :data_source


  ## ib outlets
  outlet :scroller, UIScrollView
  outlet :btn_hello


  def say_hello(sender)
    # TODO Implement action here
  end


end