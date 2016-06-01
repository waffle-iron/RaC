module ThemeHelper

  def toolbar_builder(toolbar)
    content = content_tag(:h2) do
      @header&.title
    end

    content << content_tag(:ul, class: "actions") do
      @header.toolbar.buttons do |button|
        content_tag(:ul, class: "block-header") do
          content_tag(:a, href: button.link) do
            content_tag(:i, class: "zdmi zdmi-#{button.icon}")
          end
          content_tag(:li) do
          end
        end
      end
    end

    content.join.html_safe
  end

  def card(title = ['',''], &body)
    content = capture(&body)
    card_body = content_tag(:div, content, class: 'card-body card-padding')
    content_tag :div, class: 'card' do
      concat card_header(title[0], title[1])
      concat card_body
    end
  end

  def card_header(title, title2)
    content_tag :div, class: 'card-header' do
      concat content_tag(:h2, title)
      concat content_tag(:small, title2)
    end
  end

end
