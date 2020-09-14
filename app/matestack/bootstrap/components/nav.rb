class Bootstrap::Components::Nav < Matestack::Ui::Component

  optional :items, :tabs, :pills, :fill, :justified, :vertical, :horizontal, 
            class: { as: :bs_class }, attributes: { as: :bs_attrs}

  def response 
    ul nav_attributes do
      nav_items_partial if items.present?
      yield_components if !items.present?
    end
  end

  protected

  def nav_items_partial
    items.each_with_index do |(key, item), index|
      li class: "nav-item" do
        case item[:type]
        when :link
          link link_attrs item[:path], item[:text], index, item[:disabled]
        else
          transition link_attrs item[:path], item[:text], index, item[:disabled]
        end
      end
    end
  end

  def link_attrs path, text, index, disabled
    {}.tap do |hash|
      hash[:class] = "nav-link #{'active' if path == request.fullpath } #{'disabled' if disabled}"

      hash[:attributes] = {}.tap do |hash|
        hash[:'aria-selected'] = path == request.fullpath ? 'true' : 'false'
        hash[:'aria-current'] = 'page' if index == 0
        hash[:'aria-disabled'] = 'true' if disabled
        hash[:role] = "tab" if toggle.present?
        hash[:'aria-controls'] = "#{path.gsub('#','')}" if toggle.present?
      end

      hash[:data] = { toggle: "pill" } if pills 
      hash[:data] = { toggle: "tab" } if tabs
      hash[:text] = text
      hash[:path] = path
    end
  end

  def nav_attributes
    html_attributes.merge(
      class: nav_classes,
      attributes: bs_attrs
    )
  end

  def nav_classes
    [].tap do |classes|
      classes << 'nav'
      classes << 'nav-tabs' if tabs
      classes << 'nav-pills' if pills
      classes << 'nav-fill' if fill
      classes << 'nav-justified' if justified
      classes << 'flex-column' if vertical
      classes << "justify-content-#{horizontal}" if horizontal.present?
      classes << bs_class
    end.join(' ').strip
  end
end