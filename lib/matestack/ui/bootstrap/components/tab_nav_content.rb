require_relative "../base_component"

class Matestack::Ui::Bootstrap::Components::TabNavContent < Matestack::Ui::Bootstrap::BaseComponent

  required :id

  optional :active, class: { as:  :bs_class }

  def response
    div tab_content_attributes do
      yield if block_given?
    end
  end

  protected

  def tab_content_attributes
    options.merge(
      id: "tab-#{context.id}-content",
      class: tab_content_classes,
      role: "tabpanel",
      "aria-labelledby": "tab-#{context.id}"
    )
  end

  def tab_content_classes
    [].tap do |classes|
      classes << 'tab-pane'
      classes << 'fade'
      classes << 'show ' if context.active
      classes << 'active' if context.active
      classes << context.bs_class
    end.join(' ').strip
  end
end
