class FlickrSearchViewController < UIViewController
  extend IB

  outlet :searchBox, UISearchBar
  outlet :imageView, UIImageView

  def initialize
    @images = []
  end

  def viewDidLoad
    super
    searchBox.delegate = self
  end

  def searchBarSearchButtonClicked(searchBarView)
    searchBarView.resignFirstResponder
    search_for!(searchBarView.text)
  end

  def on_swipe(recognizer)
    return if @images.empty?
    index = @images.index(@active)
    set_active_image @images[index + 1]
  end

  # Sample API URL:
  #
  def search_for!(query)
    url = url_for_image_api(query)
    request.GET(url, parameters: nil, success: method(:success), failure: method(:failure))
  end

  def success(operation, responseObject)
    @images = responseObject['responseData']['results']
    reset_image_view
  end

  def failure(operation, error)

  end

  def reset_image_view
    set_active_image @images.first
  end

  private

  def set_active_image(image)
    @active = image
    imageView.setImage(build_active_ui_image)
  end

  def build_active_ui_image
    url = NSURL.URLWithString @active['tbUrl']
    data = NSData.dataWithContentsOfURL(url)
    UIImage.new.initWithData(data)
  end

  def url_for_image_api(query)
    "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{query}"
  end

  def request
    AFHTTPRequestOperationManager.manager
  end

end

