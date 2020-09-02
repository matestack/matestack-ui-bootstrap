class Components::Listgroup < Matestack::Ui::StaticComponent
  html_attributes :role

  optional :id, :items, :item_class, :checkbox, :horizontal, :h_size, :flush, :tablist, class: { as: :bs_class }

  # TODO: Set list items acitve

  def response 
    ul lg_attributes do
      yield_components if !items.present?
      list_partial if items.present?
    end
  end

  protected

  def list_partial
    items.each do |key, item|
      case item[:type]        
      when :link 
        link link_attrs item[:id], item[:color], item[:path]  do
          plain item[:content]
        end
      when :button 
        button id: item[:id], class: "#{list_classes item[:color], true} #{"active" if item[:active]}", attributes: { type: "button" } do
          plain item[:content]
        end
      when :label 
        label id: item[:id], class: "#{list_classes item[:color], false}" do
          input class: "form-check-input mr-1", attributes: { 'type': "checkbox", 'value': "" } if checkbox
          plain item[:content]
        end
      else
        li id: item[:id], class: "#{list_classes item[:color], false}" do
          input class: "form-check-input mr-1", attributes: { 'type': "checkbox", 'value': "", 'aria-label': "#{item[:content]}" } if checkbox
          # span class: "badge bg-primary rounded-pill", text: item[:badge]
          plain item[:content]
        end
      end
    end
  end

  def lg_attributes
    attributes = {}.tap do |hash|
      hash[:class] = lg_classes
      hash[:attributes] = { role: "tablist" } if tablist
    end
    html_attributes.merge(
      attributes
    )
  end

  def lg_classes
    [].tap do |classes|
      classes << 'list-group'
      classes << (h_size.present? ? "list-group-horizontal-#{h_size}": "list-group-horizontal") if horizontal
      classes << 'list-group-flush' if flush
      classes << bs_class
    end.join(' ').strip
  end

  def link_attrs l_id, color, path
    {}.tap do |hash|
      hash[:id] = l_id
      hash[:class] = "#{list_classes color, true}"
      hash[:data] = { toggle: "list" } if tablist
      hash[:attributes] = { 'aria-controls': "#{id}", role: "tab" } if tablist
      hash[:path] = path
    end
  end

  def list_classes color, action
    [].tap do |classes|
      classes << 'list-group-item'
      classes << 'list-group-item-action' if action
      classes << "list-group-item-#{color}" if color.present?
      classes << item_class
    end.join(' ').strip
  end
end