class Matestack::Ui::Bootstrap::Components::TabNav < Matestack::Ui::Bootstrap::BaseComponent

  required :id

  optional  :items, :variant, :fill, :justified, :vertical, :vertical_up_to_sm,
            :vertical_up_to_md, :vertical_up_to_xl, :horizontal,
            class: { as:  :bs_class }

  def response
    if context.items.present?
      ul nav_attributes do
        nav_items_partial
      end
    end
    div class: "tab-content", id: "#{context.id}Content" do
      yield if block_given?
    end
  end

  protected

  def nav_items_partial
    context.items.each do |item|
      li class: "nav-item", role: "presentation" do
        a  class: "nav-link #{'active' if item[:active]}",
              id: "tab-#{item[:id]}",
              path: "#tab-#{item[:id]}-content",
              role: "tab",
              "aria-controls": "tab-#{item[:id]}",
              "aria-selected": "#{'true' if item[:active]}",
              "data-bs-toggle": "tab" do
                bs_icon name: item[:icon], size: 20 if item[:icon]
                span item[:text], class: "#{'ps-3' if item[:icon]}" if item[:text]
              end
      end
    end
  end

  def link_attrs path, active, disabled, delay=nil
    {}.tap do |hash|
      hash[:class] = "nav-link #{'active' if path == request.fullpath } #{'disabled' if disabled}"
      hash[:'aria-selected'] = path == request.fullpath ? 'true' : 'false'
      hash[:'aria-current'] = 'page' if active == true
      hash[:'aria-disabled'] = 'true' if disabled
      hash[:role] = "tab" if toggle.present?
      hash[:'aria-controls'] = "#{path.gsub('#','')}" if context.toggle.present?

      hash[:data] = { "bs-toggle": "pill" } if context.pills
      hash[:data] = { "bs-toggle": "tab" } if context.tabs
      hash[:path] = path
    end
  end

  def nav_attributes
    options.merge(
      id: context.id,
      class: nav_classes,
      role: "tablist"
    )
  end

  def nav_classes
    [].tap do |classes|
      classes << 'nav'
      classes << 'nav-tabs' if context.variant == :tabs || context.variant.nil?
      classes << 'nav-pills' if context.variant == :pills
      classes << 'nav-fill' if context.fill
      classes << 'nav-justified' if context.justified
      classes << 'flex-column' if context.vertical
      classes << 'flex-column flex-sm-column flex-md-row' if context.vertical_up_to_sm
      classes << 'flex-column flex-sm-column flex-md-column flex-lg-row' if context.vertical_up_to_md
      classes << 'flex-column flex-sm-column flex-md-column flex-lg-column flex-xl-row' if context.vertical_up_to_xl
      classes << "justify-content-#{context.horizontal}" if context.horizontal.present?
      classes << context.bs_class
    end.join(' ').strip
  end
end
