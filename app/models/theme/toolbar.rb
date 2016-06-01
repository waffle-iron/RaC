class Theme::Toolbar
  attr_accessor :buttons
  def initialize
    self.buttons = []
  end

  def add_button(title, link, icon)
    self.buttons + [Button.new(title, link, icon)]
  end

  class Button
    attr_accessor :title, :link, :icon
    def initialize(title, link, icon)
      self.title = title
      self.link = link
      self.icon = icon
    end
  end
end
