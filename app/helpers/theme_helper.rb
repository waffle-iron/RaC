module ThemeHelper

  def toolbar_builder(toolbar)
    content_tag(:ul, class: "actions") do
      toolbar.buttons.each do |button|
        concat button_builder(button)
      end
    end
  end

  def button_builder(button)
    options = {'data-toggle' => 'tooltip', 'data-placement' => 'bottom', 'data-original-title' => button.title, href: button.link}
    options.merge!({data: {confirm: 'Esta seguro?'}, 'data-method' => :delete}) if button.icon == 'delete'

    content_tag(:li) do
      content_tag(:a, nil,  options) do
        content_tag(:i, nil, class: "zmdi zmdi-#{button.icon}")
      end
    end
  end

  def card(title = ['',''], toolbar = Theme::Toolbar.new, &body)
    content = capture(&body)
    card_body = content_tag(:div, content, class: 'card-body card-padding')
    content_tag :div, class: 'card' do
      concat card_header(title[0], title[1], toolbar)
      concat card_body
    end
  end

  def card_header(title, title2, toolbar)
    content = content_tag(:h2, title) +
      content_tag(:small, title2) +
      toolbar_builder(toolbar)
    content_tag :div, class: 'card-header' do
      concat content
    end
  end

  def card_text_field(value, options = {})
    label_option = options[:label]
    label_tag =  content_tag :p, class: 'c-black f-500 m-t-10 m-b-5' do
      concat label_option
    end

    options = options.except(:label).merge({class:'input-sm form-control fg-input', type: 'text', value: value})
    super_content = content_tag :input, nil, options
    content_tag :div, class: 'form-group fg-float' do
      content_tag :div, class: 'fg-line' do
        concat label_tag
        concat super_content
      end
    end
  end

  def card_text_field_readonly(value, options = {})
    options = options.merge(readonly: 'true')
    card_text_field value, options
  end

  def table_button(title = 'table_button', link = '#', icon = 'bug', options = {}, command = 'command-edit')

    options.merge!({ 'data-confirm' => "Esta seguro?" , 'data-method' => :delete , 'method' => :delete}) if icon == 'delete'

    options.merge!({'data-row-id' => 'rowId', type: 'button', class: "btn btn-icon #{command} waves-effect waves-circle"})
    options.merge!({'data-toggle' => 'tooltip', 'data-placement' => 'bottom', 'data-original-title' => title, href: link})

    content_tag(:button, nil, options) do
      concat content_tag(:span, nil,  class: "zmdi zmdi-#{icon}")
    end
  end

end
