class Matestack::Ui::Bootstrap::Components::ListGroup < Matestack::Ui::Component
  options :role

  optional :items
  optional :horizontal, :horizontal_size, :checkbox
  optional :variant, :class


  def response
    if actionable_items?
      div list_group_attributes do
        yield unless context.items
        list_partial if context.items
      end
    else
      ul list_group_attributes do
        yield unless context.items
        list_partial if context.items
      end
    end
  end

  protected

  def actionable_items?
    if context.items.present?
      context.items.any? { |item| [:tab, :transition, :action, :link].include?(item[:type]) }
    else
      false
    end
  end

  def tab_nav?
    if context.items.present?
      context.items.any? { |item| item[:type] == :tab }
    else
      false
    end
  end

  def list_partial
    context.items.each do |item|
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
          input class: "form-check-input me-1", 'type': "checkbox", 'value': ""  if context.checkbox
          text_rendering(item)
        end
      else
        li id: item[:id], class: "#{list_classes item, false}", "aria-disabled": "#{true if item[:disabled]}" do
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
      hash[:role] = "tablist" } if tab_nav?
    end
    options.merge(
      attributes
    )
  end

  def list_group_classes
    [].tap do |classes|
      classes << 'list-group'
      classes << (context.horizontal_size.present? ? "list-group-horizontal-#{context.horizontal_size}": "list-group-horizontal") if context.horizontal
      classes << 'list-group-flush' if context.variant == :flush
      classes << context.class
    end.join(' ').strip
  end

  def link_attrs(item)
    attrs = item
    attrs[:class] = "#{list_classes item, true}"
    attrs["aria-disabled"] = "#{true if item[:disabled]}" if item[:disabled]
    attrs
  end

  def tab_attrs(item)
    {}.tap do |hash|
      hash[:id] = "tab-#{item[:id]}" if tab_nav?
      hash[:class] = "#{list_classes item, true}"
      hash[:data] = { "bs-toggle": "list" }
      hash["aria-disabled"]=  "#{true if item[:disabled]}" if item[:disabled]
      hash['aria-controls'] = "#tab-#{item[:id]}-content"
      hash[:role] "tab"
      hash[:path] = "#tab-#{item[:id]}-content"
      hash[:target] = item[:target]
    end
  end

  def transition_attrs(item)
    attrs = item
    attrs[:class] = "#{list_classes item, true}"
    attrs["aria-disabled"] = "#{true if item[:disabled]}" if item[:disabled]
    attrs
  end

  def action_attrs(item)
    attrs = item
    attrs[:class] = "#{list_classes item, true}"
    attrs["aria-disabled"] = "#{true if item[:disabled]}" if item[:disabled]
    attrs
  end

  def list_classes(item, action)
    [].tap do |classes|
      classes << 'list-group-item'
      classes << 'list-group-item-action' if context.action
      classes << "list-group-item-#{item[:variant]}" if item[:variant].present?
      classes << 'active' if item[:active]
      classes << 'disabled' if item[:disabled]
      classes << 'd-flex justify-content-between align-items-center' if item[:badge].present?
      classes << item[:class]
    end.join(' ').strip
  end

end
