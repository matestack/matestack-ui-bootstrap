class Bootstrap::Components::Dropdown < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-dropdown"

  optional :variant, :text, :btn_class # button attributes
  optional :direction, :align, :offset, :reference
  # dropdown menu attributes, expects an array of items with possible keys: type, path, text
  # or hash with possible keys: items, class
  optional :menu
  optional class: { as: :bs_class }, id: { as: :bs_id }, data: { as: :bs_data }
  optional :slots
  optional :size

  def prepare
    @bs_menu = self.menu.is_a?(Hash) ? self.menu : { items: self.menu }
  end
  def response
    div dropdown_attributes do
      split_btn_partial if slots && slots[:split_btn]
      btn btn_attributes unless slots && slots[:split_btn]

      ul menu_attributes do
        menu_partial unless @bs_menu[:items].blank?
        yield_components
      end
    end
  end

  protected

  def split_btn_partial
    slot slots[:split_btn]
    btn btn_attributes do
      span class:"sr-only" do plain "Toggle Dropdown" end
    end
  end

  def menu_partial
    @bs_menu[:items].each do |item|
      case item[:type]
      when :button
        li do btn item.merge(class: "dropdown-item #{item[:class]}") end
      when :divider
        li do hr class: "dropdown-divider" end
      when :link
        li do link item.merge(class: "dropdown-item #{item[:class]}") end
      when :transition
        li do transition item.merge(class: "dropdown-item #{item[:class]}") end
      when :action
        li do action item.merge(class: "dropdown-item #{item[:class]}") do plain item[:text] end end
      else
        span class: "dropdown-item-text" do plain item[:text] end
      end
    end
  end

  def dropdown_attributes
    html_attributes.merge(
      class: dropdown_classes
    )
  end

  def dropdown_classes
    [].tap do |classes|
      classes << ((slots && slots[:split_btn]) ? 'btn-group' : 'dropdown')
      classes << "drop#{direction}" if direction.present?
      classes << bs_class
    end.join(' ').strip
  end

  def btn_attributes
    {
      id: bs_id,
      text: "#{text unless (slots && slots[:split_btn])}",
      variant: (variant || :primary),
      class: btn_classes,
      data: btn_data,
      size: size,
      attributes: { 'aria-expanded': "false" }
    }
  end

  def btn_data
    (bs_data || {}).tap do |hash|
      hash["bs-toggle"] = 'dropdown'
      hash[:offset] = offset if offset.present?
      hash[:reference] = reference if reference.present?
    end
  end

  def btn_classes
    [].tap do |classes|
      classes << 'dropdown-toggle'
      classes << 'dropdown-toggle-split' if slots && slots[:split_btn]
      #custom classes
      classes << btn_class
    end.join(' ').strip
  end

  def menu_attributes
    {
      class: menu_classes,
      data: { toggle: 'dropdown' },
      attributes: { 'aria-labelledby': bs_id }
    }
  end

  def menu_classes
    [].tap do |classes|
      classes << 'dropdown-menu'
      classes << "dropdown-menu-#{align}" if align.present?
      #custom classes
      classes << @bs_menu[:class] if menu.is_a?(Hash)
    end.join(' ').strip
  end

end
