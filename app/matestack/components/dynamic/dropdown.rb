class Components::Dynamic::Dropdown < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-dropdown" 
  
  optional :style, :split, :text, :direction, :align, :offset, :reference,
            :btn_class, :menu_items, :menu_class,
            class: { as: :bs_class }, id: { as: :bs_id },
            data: { as: :bs_data }

  def setup
    @component_config["dropdown-id"] = bs_id
  end

  def response 
    div dropdown_attributes do
      split_btn_partial if split 
      btn btn_attributes if !split

      ul menu_attributes do
        yield_components if menu_items.blank?
        menu_partial if !menu_items.blank?
      end
    end
  end

  protected

  def split_btn_partial
    if options[:slots] && options[:slots][:split_btn]
      slot options[:slots][:split_btn]
    else
      btn style: style, text: text
    end
    btn btn_attributes do
      span class:"sr-only" do plain "Toggle Dropdown" end
    end
  end

  def menu_partial
    menu_items.each_with_index do |(key, item), index|
      case item[:type]
      when :button 
        li do btn class: "dropdown-item", text: item[:text] end
      when :divider
        li do hr class: "dropdown-divider" end
      when :link
        li do link class: "dropdown-item", path: item[:path], text: item[:text] end
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
      classes << (split ? 'btn-group' : 'dropdown')
      classes << "drop#{direction}" if direction.present?      
      #custom classes 
      classes << bs_class
    end.join(' ').strip
  end

  def btn_attributes
    {
      id: bs_id,
      text: "#{text if !split}",
      style: style, 
      class: btn_classes,
      data: btn_data,
      attributes: { 'aria-expanded': "false" }
    }
  end
  
  def btn_data
    (bs_data || {}).tap do |hash|
      hash[:toggle] = 'dropdown'
      hash[:offset] = offset if offset.present?
      hash[:reference] = reference if reference.present?
    end
  end

  def btn_classes
    [].tap do |classes|
      classes << 'dropdown-toggle'
      classes << 'dropdown-toggle-split' if split
      #custom classes 
      classes << btn_class
    end.join(' ').strip
  end

  def menu_attributes
    {
      class: menu_classes,
      data: { toggle:"dropdown" },
      attributes: { 'aria-labelledby': bs_id }
    }
  end

  def menu_classes
    [].tap do |classes|
      classes << 'dropdown-menu'
      classes << "dropdown-menu-#{align}" if align.present? 
      #custom classes 
      classes << menu_class
    end.join(' ').strip
  end
  
end