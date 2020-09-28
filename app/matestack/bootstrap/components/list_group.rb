class Bootstrap::Components::ListGroup < Matestack::Ui::Component
  html_attributes :role

  #  optional :id 
  optional :items 
  optional :horizontal, :horizontal_size, :checkbox
  optional :flush, :tablist, class: { as: :bs_class }


  def response 
    ul list_group_attributes do
      yield_components unless items
      list_partial if items
    end
  end

  protected

  def list_partial
    items.each do |item|
      case item[:type]        
      when :link 
        link link_attrs(item)  do
          plain item[:text]
        end
      when :transition 
        transition link_attrs(item)  do
          plain item[:text]
        end
      when :label 
        label id: item[:id], class: "#{list_classes item, false}" do
          input class: "form-check-input mr-1", attributes: { 'type': "checkbox", 'value': "" } if checkbox
          plain item[:text]
        end
      else
        li id: item[:id], class: "#{list_classes item, false}" do
          input class: "form-check-input mr-1", attributes: { 'type': "checkbox", 'value': "", 'aria-label': "#{item[:text]}" } if checkbox
          plain item[:text]
        end
      end
    end
  end

  def list_group_attributes
    attributes = {}.tap do |hash|
      hash[:class] = list_group_classes
      hash[:attributes] = { role: "tablist" } if tablist
    end
    html_attributes.merge(
      attributes
    )
  end

  def list_group_classes
    [].tap do |classes|
      classes << 'list-group'
      classes << (horizontal_size.present? ? "list-group-horizontal-#{horizontal_size}": "list-group-horizontal") if horizontal
      classes << 'list-group-flush' if flush
      classes << bs_class
    end.join(' ').strip
  end

  def link_attrs(item)
    {}.tap do |hash|
      hash[:id] = item[:id]
      hash[:class] = "#{list_classes item, true}"
      hash[:data] = { toggle: "list" } if tablist
      hash[:attributes] = { 'aria-controls': "#{id}", role: "tab" } if tablist
      hash[:path] = item[:path]
    end
  end

  def list_classes(item, action)
    [].tap do |classes|
      classes << 'list-group-item'
      classes << 'list-group-item-action' if action
      classes << "list-group-item-#{item[:variant]}" if item[:variant].present?
      classes << 'active' if item[:active]
      classes << item[:class]
    end.join(' ').strip
  end

end