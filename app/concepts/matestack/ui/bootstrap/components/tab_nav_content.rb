class Matestack::Ui::Bootstrap::Components::TabNavContent < Matestack::Ui::Component

  required :id

  optional :active, :class

  def response
    div tab_content_attributes do
      yield
    end
  end

  protected

  def tab_content_attributes
    options.merge(
      id: "tab-#{context.id}-content",
      class: tab_content_classes,
      role: "tabpanel",
      "aria-labelledby": "tab-#{id}"
    )
  end

  def tab_content_classes
    [].tap do |classes|
      classes << 'tab-pane'
      classes << 'fade'
      classes << 'show ' if context.active
      classes << 'active' if context.active
      classes << context.class
    end.join(' ').strip
  end
end
