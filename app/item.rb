class Item
  attr_accessor :text

  def initialize(item)
		@text = item[:text]
  end
end
