class ThemeBuilder < ActionView::Helpers::FormBuilder
  def email_field(method, options = {})
    label_option = options[:label]
    options = options.except(:label).merge({class:'input-sm form-control fg-input'})
    super_content = super
    @template.content_tag :div, class: 'form-group fg-float' do
      @template.content_tag :div, class: 'fg-line' do
        @template.concat super_content
        @template.concat label label_option, class: 'fg-label' if label_option
      end
    end
  end

  def text_field(method, options = {})
    label_option = options[:label]
    options = options.except(:label).merge({autocomplete: 'off'})
    options = options.except(:label).merge({class:'input-sm form-control fg-input'}) unless options[:class]
    super_content = super
    @template.content_tag :div, class: 'form-group fg-float' do
      @template.content_tag :div, class: 'fg-line' do
        @template.concat super_content
        @template.concat label label_option, class: 'fg-label' if label_option
      end
    end
  end

  def number_field(method, options = {})
    label_option = options[:label]
    options = options.except(:label).merge({autocomplete: 'off', step: 'any'})
    options = options.except(:label).merge({class:'input-sm form-control fg-input'}) unless options[:class]
    super_content = super
    @template.content_tag :div, class: 'form-group fg-float' do
      @template.content_tag :div, class: 'fg-line' do
        @template.concat super_content
        @template.concat label label_option, class: 'fg-label' if label_option
      end
    end
  end

  def password_field(method, options = {})
    label_option = options[:label]
    options = options.except(:label).merge({class:'input-sm form-control fg-input'})
    super_content = super
    @template.content_tag :div, class: 'form-group fg-float' do
      @template.content_tag :div, class: 'fg-line' do
        @template.concat super_content
        @template.concat label label_option, class: 'fg-label' if label_option
      end
    end
  end

  def check_box(method, options = {}, checked_value = "true", unchecked_value = "false")
    label_option = options[:label]
    options = options.except(:label).merge({checked: @object[method]})
    super_content = ActionView::Helpers::Tags::CheckBox.new(object_name, method, self, checked_value, unchecked_value, options).render
    @template.content_tag :div, class: 'form-group fg-float checkbox m-b-15' do
      @template.content_tag :div, class: 'fg-line' do
        @template.content_tag :label do
          @template.concat super_content
          @template.concat @template.content_tag :i, '', class: 'input-helper'
          @template.concat label_option if label_option
          @template.concat @template.content_tag :br
        end
      end
    end
  end

  def submit(value=nil, options ={})
    options = options.merge({type: :submit, class: 'btn btn-primary btn-sm m-t-10 waves-effect'})
    @template.content_tag :button, value, options
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    label_option = options[:label]
    html_options = options.except(:label).merge({class:'chosen', 'data-placeholder' => 'Seleccione ...'})

    label = @template.content_tag(:p, nil, class: 'f-500 c-black m-b-15') do
      label_option if label_option
    end

    super_content = super
    @template.content_tag :div, class: 'form-group fg-float' do
      @template.content_tag :div, class: 'fg-line' do
        @template.concat label if label_option
        @template.concat super_content
      end
    end
  end

  def date_select(method, options = {})
    existing_date = object.send(method)
    # formatted_date = existing_date.to_date.strftime("%F") if existing_date.present?
    formatted_date = existing_date.to_date.strftime("%d-%m-%Y") if existing_date.present?

    label_option = options[:label]
    options = options.except(:label).merge({class:'form-control date-picker', autocomplete: 'off', value: formatted_date})
    options.merge!({:"data-date-format" => "DD-MM-YYYY"})
    super_content = ActionView::Helpers::Tags::TextField.new(object_name, method, self, options).render
    @template.content_tag :div, class: 'form-group fg-float' do
      @template.content_tag :div, class: 'fg-line' do
        @template.concat super_content
        @template.concat label label_option, class: 'fg-label' if label_option
      end
    end
  end

  def datetime_select(method, options = {})
    existing_date = object.send(method)
    # formatted_date = existing_date.to_date.strftime("%F") if existing_date.present?
    formatted_date = existing_date.to_date.strftime("%d-%m-%Y") if existing_date.present?

    label_option = options[:label]
    options = options.except(:label).merge({class:'form-control date-time-picker', autocomplete: 'off', value: formatted_date})
    # options.merge!({:"data-date-format" => "DD-MM-YYYY"})
    super_content = ActionView::Helpers::Tags::TextField.new(object_name, method, self, options).render
    @template.content_tag :div, class: 'form-group fg-float' do
      @template.content_tag :div, class: 'fg-line' do
        @template.concat super_content
        @template.concat label label_option, class: 'fg-label' if label_option
      end
    end
  end

  def xdate_select(method, options = {}, html_options = {})
    existing_date = @object.send(method)
    formatted_date = existing_date.to_date.strftime("%F") if existing_date.present?
    options.merge!({value: formatted_date})
    options.merge!({class: "form-control date-picker"})
    options.merge!({:"data-date-format" => "DD-MM-YYYY"})
    @template.content_tag(:div, :class => "form-group") do
      # @template.concat ActionView::Helpers::Tags::TextField.new(object_name, method, self, options).render
      text_field(method, options )
    end
  end
end
