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

  def card_check_box(value, options = {}, checked_value = "true", unchecked_value = "false")
    label_option = options[:label]
    options = options.except(:label)
    options.merge!({value: value, checked: value,  type: 'checkbox', disabled: true, readonly: true})
    super_content = content_tag(:input, nil, options)
    #super_content = ActionView::Helpers::Tags::CheckBox.new(object_name, , self, checked_value, unchecked_value, options).render
    content_tag :div, class: 'checkbox m-b-15' do
      content_tag :label do
        concat super_content
        concat content_tag :i, '', class: 'input-helper'
        concat label_option if label_option
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

  def side_menu(&body)
    content = capture(&body)

    content = content_tag :ul, nil, class: 'main-menu' do
        concat content
      end
    content = side_menu_profile + content

    content_tag(:aside, {id: 'sidebar',class: 'sidebar c-overflow'}) do
      content
    end
  end

  def side_button(title = '', link = '', icon = '', options = {} )
    options.merge!({href: link})
    content = content_tag(:a, nil, options) do
      concat content_tag(:i, nil, class: "zmdi zmdi-#{icon}")
      concat title
    end
    content_tag(:li, nil) do
      concat content
    end
  end

  def side_submenu(title = '', icon = '', &body)
    submenu_content = content_tag(:a, nil, 'data-ma-action' => 'submenu-toggle') do
      concat content_tag(:i, nil, class: "zmdi zmdi-#{icon}")
      concat title
    end

    content = content_tag :ul do
      concat capture(&body)
    end

    content_tag :li, nil, class: 'sub-menu' do
      concat submenu_content
      concat content
    end
  end

  def side_submenu_button(title = '', link = '')
    content = content_tag(:a, nil, {href: link}) do
      concat title
    end
    content_tag(:li, nil) do
      concat content
    end
  end

  def side_menu_profile
    picture = content_tag(:div, class: 'sp-pic') do
      content_tag(:img, nil, {src: '/img/blank_avatar.jpg'})
    end

    profile = content_tag(:div, class: 'sp-info') do
      concat current_user&.name
      concat content_tag(:i, nil, class: "zmdi zmdi-caret-down")
    end

    menu = content_tag(:ul, nil, class: 'main-menu') do
      side_button('Salir', destroy_user_session_path, 'time-restore', { 'data-confirm' => "Esta seguro?" , 'data-method' => :delete , 'method' => :delete})
    end

    content_tag(:div, class: 's-profile') do
      content_tag(:a, nil, {href: '', 'data-ma-action' => 'profile-menu-toggle'}) do
        concat picture
        concat profile
        concat menu
      end
    end
  end

  def tree(name, array, title_key, value_key, node_key, parent_node_key, link_template = "", check_id_array = nil, include_color = 'green', exclude_color = 'red')
    content_tag(:ul, nil, {id: name}) do
      array.each do |node|
        concat tree_node(node, title_key, value_key, node_key, link_template, check_id_array, include_color, exclude_color) unless node[parent_node_key]
      end
    end
  end

  def tree_node(node, title_key, value_key, node_key, link_template, check_id_array, include_color, exclude_color)
    color = node_color(node, value_key, check_id_array, include_color, exclude_color)

    link = link_template.gsub(":#{value_key.to_s}", node[value_key].to_s)
    link =  content_tag(:a, nil, href: (color == exclude_color ? nil : link), style: "color:#{color}") do
      concat node[title_key]
    end

    subnodes = node.send(node_key)

    if subnodes
      content = content_tag(:ul, nil) do
        subnodes.each do |sub_node|
          concat tree_node(sub_node, title_key, value_key, node_key, link_template, check_id_array, include_color, exclude_color)
        end
      end
    end
    content_tag(:li, nil) do
      concat link
      concat content if subnodes
    end
  end

  def node_color(node, value_key, check_id_array, include_color, exclude_color)
    return 'blue' unless check_id_array
    if check_id_array.include?(node[value_key])
      include_color
    else
      exclude_color
    end

  end

end
