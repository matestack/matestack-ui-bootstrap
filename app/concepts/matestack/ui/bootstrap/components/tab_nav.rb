class Matestack::Ui::Bootstrap::Components::TabNav < Matestack::Ui::Component

  requires :id

  optional  :items, :variant, :fill, :justified, :vertical, :vertical_up_to_sm,
            :vertical_up_to_md, :vertical_up_to_xl, :horizontal,
            class: { as: :bs_class }, attributes: { as: :bs_attrs}

  def response
    ul nav_attributes do
      nav_items_partial if items.present?
    end
    div class: "tab-content", id: "#{id}Content" do
      yield_components
    end
  end

  protected

  def nav_items_partial
    items.each do |item|
      li class: "nav-item", attributes: { role: "presentation" } do
        # '<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Home</a>'
        link  class: "nav-link #{'active' if item[:active]}",
              id: "tab-#{item[:id]}",
              path: "#tab-#{item[:id]}-content",
              attributes: {
                role: "tab",
                "aria-controls": "tab-#{item[:id]}",
                "aria-selected": "#{'true' if item[:active]}",
                "data-bs-toggle": "tab"
              } do
                bs_icon name: item[:icon], size: 20 if item[:icon]
                span class: "#{'ps-3' if item[:icon]}", text: item[:text] if item[:text]
              end
      end
    end
  end

  def link_attrs path, active, disabled, delay=nil
    {}.tap do |hash|
      hash[:class] = "nav-link #{'active' if path == request.fullpath } #{'disabled' if disabled}"

      hash[:attributes] = {}.tap do |hash|
        hash[:'aria-selected'] = path == request.fullpath ? 'true' : 'false'
        hash[:'aria-current'] = 'page' if active == true
        hash[:'aria-disabled'] = 'true' if disabled
        hash[:role] = "tab" if toggle.present?
        hash[:'aria-controls'] = "#{path.gsub('#','')}" if toggle.present?
      end

      hash[:data] = { "bs-toggle": "pill" } if pills
      hash[:data] = { "bs-toggle": "tab" } if tabs
      hash[:path] = path
    end
  end

  def nav_attributes
    html_attributes.merge(
      id: id,
      class: nav_classes,
      attributes: { role: "tablist"}
    )
  end

  def nav_classes
    [].tap do |classes|
      classes << 'nav'
      classes << 'nav-tabs' if variant == :tabs || variant.nil?
      classes << 'nav-pills' if variant == :pills
      classes << 'nav-fill' if fill
      classes << 'nav-justified' if justified
      classes << 'flex-column' if vertical
      classes << 'flex-column flex-sm-column flex-md-row' if vertical_up_to_sm
      classes << 'flex-column flex-sm-column flex-md-column flex-lg-row' if vertical_up_to_md
      classes << 'flex-column flex-sm-column flex-md-column flex-lg-column flex-xl-row' if vertical_up_to_xl
      classes << "justify-content-#{horizontal}" if horizontal.present?
      classes << bs_class
    end.join(' ').strip
  end
end
