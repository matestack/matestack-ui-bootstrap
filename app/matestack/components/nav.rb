class Components::Nav < Matestack::Ui::StaticComponent

  optional :items, :tabs, :pills, :fill, :justified, :vertical, :horizontal, class: { as: :bs_class }

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
      hash[:class] = "nav-link #{'active' if index == 0 } #{'disabled' if disabled}"
      hash[:attributes] = index == 0 ? { 'aria-selected': "true" } : { 'aria-selected': "false" } # TODO: not sure how to implement active state
      hash[:attributes] = { 'aria-current': "page" } if index == 0
      hash[:attributes] = { 'aria-disabled': "true" } if disabled
      hash[:attributes] = { role: "tab", 'aria-controls': "#{path.gsub('#','')}" } if toggle.present?
      hash[:data] = { toggle: "pill" } if toggle == :pill 
      hash[:data] = { toggle: "tab" } if toggle == :tab
      hash[:text] = text
      hash[:path] = path
    end
  end

  def nav_attributes
    html_attributes.merge(
      class: nav_classes
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