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
    options = options.except(:label).merge({class:'input-sm form-control fg-input', autocomplete: 'off'})
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

  def check_box(method, options = {}, checked_value = '1', unchecked_value = '0')
    label_option = options[:label]
    options = options.except(:label)
    super_content = super
    @template.content_tag :div, class: 'checkbox m-b-15' do
      @template.content_tag :label do
        @template.concat super_content
        @template.concat @template.content_tag :i, '', class: 'input-helper'
        @template.concat label_option if label_option
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
end
