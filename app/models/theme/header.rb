class Theme::Header
  attr_accessor :title, :toolbar

  def initialize(title = nil)
    self.title = title
    self.toolbar = Theme::Toolbar.new
  end
end
