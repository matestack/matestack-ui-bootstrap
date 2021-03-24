class Matestack::Ui::Bootstrap::Components::Dropdown < Matestack::Ui::Bootstrap::BaseVueJsComponent
  vue_name "matestack-ui-bootstrap-dropdown"

  optional :variant, :text, :btn_class # button attributes
  optional :direction, :align, :offset, :reference
  # dropdown menu attributes, expects an array of items with possible keys: type, path, text
  # or hash with possible keys: items, class
  optional :menu
  optional class: { as:  :bs_class }
  optional :id, :data
  
  optional :size

  def prepare
    @bs_menu = context.menu.is_a?(Hash) ? context.menu : { items: context.menu }
  end

  def response
    div dropdown_attributes do
      split_btn_partial if slots && slots[:split_btn]
      bs_btn btn_attributes unless slots && slots[:split_btn]

      ul menu_attributes do
        menu_partial unless @bs_menu[:items].blank?
        yield if block_given?
      end
    end
  end

  protected

  def split_btn_partial
    slot :split_btn
    bs_btn btn_attributes do
      span class:"visually-hidden" do plain "Toggle Dropdown" end
    end
  end

  def menu_partial
    @bs_menu[:items].each do |item|
      case item[:type]
      when :button
        li do bs_btn item.merge(class: "dropdown-item #{item[:class]}") end
      when :divider
        li do hr class: "dropdown-divider" end
      when :link
        li do a item.merge(class: "dropdown-item #{item[:class]}") end
      when :transition
        li do transition item.merge(class: "dropdown-item #{item[:class]}") end
      when :action
        li do action item.merge(class: "dropdown-item #{item[:class]}") do plain item[:text] end end
      when :onclick
        li do onclick item.merge(class: "dropdown-item #{item[:class]}", style: "cursor: pointer;" ) do plain item[:text] end end
      else
        span class: "dropdown-item-text" do plain item[:text] end
      end
    end
  end

  def dropdown_attributes
    options.merge(
      class: dropdown_classes
    )
  end

  def dropdown_classes
    [].tap do |classes|
      classes << ((slots && slots[:split_btn]) ? 'btn-group' : 'dropdown')
      classes << "drop#{context.direction}" if context.direction.present?
      classes << context.bs_class
    end.join(' ').strip
  end

  def btn_attributes
    {
      id: context.id,
      text: "#{context.text unless (slots && slots[:split_btn])}",
      variant: (context.variant || :primary),
      class: btn_classes,
      data: btn_data,
      size: context.size,
      'aria-expanded': "false"
    }
  end

  def btn_data
    (context.data || {}).tap do |hash|
      hash["bs-toggle"] = 'dropdown'
      hash[:offset] = context.offset if context.offset.present?
      hash[:reference] = context.reference if context.reference.present?
    end
  end

  def btn_classes
    [].tap do |classes|
      classes << 'dropdown-toggle'
      classes << 'dropdown-toggle-split' if slots && slots[:split_btn]
      #custom classes
      classes << context.btn_class
    end.join(' ').strip
  end

  def menu_attributes
    {
      class: menu_classes,
      'aria-labelledby': context.id
    }
  end

  def menu_classes
    [].tap do |classes|
      classes << 'dropdown-menu'
      classes << "dropdown-menu-#{context.align}" if context.align.present?
      #custom classes
      classes << @bs_menu[:class] if context.menu.is_a?(Hash)
    end.join(' ').strip
  end

end
