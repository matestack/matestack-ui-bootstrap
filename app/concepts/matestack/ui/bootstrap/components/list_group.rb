class Matestack::Ui::Bootstrap::Components::ListGroup < Matestack::Ui::Component
  html_attributes :role

  optional :items
  optional :horizontal, :horizontal_size, :checkbox
  optional :variant, class: { as: :bs_class }


  def response
    if actionable_items?
      div list_group_attributes do
        yield_components unless items
        list_partial if items
      end
    else
      ul list_group_attributes do
        yield_components unless items
        list_partial if items
      end
    end
  end

  protected

  def actionable_items?
    if items.present?
      items.any? { |item| [:tab, :transition, :action, :link].include?(item[:type]) }
    else
      false
    end
  end

  def tab_nav?
    if items.present?
      items.any? { |item| item[:type] == :tab }
    else
      false
    end
  end

  def list_partial
    items.each do |item|
      case item[:type]
      when :link
        link link_attrs(item)  do
          text_rendering(item)
        end
      when :tab
        link tab_attrs(item)  do
          text_rendering(item)
        end
      when :transition
        transition transition_attrs(item)  do
          text_rendering(item)
        end
      when :action
        action action_attrs(item)  do
          text_rendering(item)
        end
      when :label
        label id: item[:id], class: "#{list_classes item, false}" do
          input class: "form-check-input me-1", attributes: { 'type': "checkbox", 'value': "" } if checkbox
          text_rendering(item)
        end
      else
        li id: item[:id], class: "#{list_classes item, false}", attributes: { "aria-disabled": "#{true if item[:disabled]}" } do
          # this implementation is useless, would need to be connected to a form through bs_form_checkbox
          # input class: "form-check-input me-1", attributes: { 'type': "checkbox", 'value': "", 'aria-label': "#{item[:text]}" } if checkbox
          text_rendering(item)
          bs_badge variant: :primary, rounded: true, text: item[:badge] if item[:badge]
        end
      end
    end
  end

  def text_rendering(item)
    bs_icon name: item[:icon] if item[:icon]
    plain item[:text]
  end

  def list_group_attributes
    attributes = {}.tap do |hash|
      hash[:class] = list_group_classes
      hash[:attributes] = { role: "tablist" } if tab_nav?
    end
    html_attributes.merge(
      attributes
    )
  end

  def list_group_classes
    [].tap do |classes|
      classes << 'list-group'
      classes << (horizontal_size.present? ? "list-group-horizontal-#{horizontal_size}": "list-group-horizontal") if horizontal
      classes << 'list-group-flush' if variant == :flush
      classes << bs_class
    end.join(' ').strip
  end

  def link_attrs(item)
    attrs = item
    attrs[:class] = "#{list_classes item, true}"
    attrs[:attributes] = { "aria-disabled": "#{true if item[:disabled]}" } if item[:disabled]
    attrs
  end

  def tab_attrs(item)
    {}.tap do |hash|
      hash[:id] = "tab-#{item[:id]}" if tab_nav?
      hash[:class] = "#{list_classes item, true}"
      hash[:data] = { "bs-toggle": "list" }
      hash[:attributes] = { "aria-disabled": "#{true if item[:disabled]}" } if item[:disabled]
      hash[:attributes] = { 'aria-controls': "#tab-#{item[:id]}-content", role: "tab" }
      hash[:path] = "#tab-#{item[:id]}-content"
      hash[:target] = item[:target]
    end
  end

  def transition_attrs(item)
    attrs = item
    attrs[:class] = "#{list_classes item, true}"
    attrs[:attributes] = { "aria-disabled": "#{true if item[:disabled]}" } if item[:disabled]
    attrs
  end

  def action_attrs(item)
    attrs = item
    attrs[:class] = "#{list_classes item, true}"
    attrs[:attributes] = { "aria-disabled": "#{true if item[:disabled]}" } if item[:disabled]
    attrs
  end

  def list_classes(item, action)
    [].tap do |classes|
      classes << 'list-group-item'
      classes << 'list-group-item-action' if action
      classes << "list-group-item-#{item[:variant]}" if item[:variant].present?
      classes << 'active' if item[:active]
      classes << 'disabled' if item[:disabled]
      classes << 'd-flex justify-content-between align-items-center' if item[:badge].present?
      classes << item[:class]
    end.join(' ').strip
  end

end
