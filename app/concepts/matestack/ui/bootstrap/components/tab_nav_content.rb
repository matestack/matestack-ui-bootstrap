class Matestack::Ui::Bootstrap::Components::TabNavContent < Matestack::Ui::Component

  requires :id

  optional :tabs, :pills, :active, class: { as: :bs_class }, attributes: { as: :bs_attrs}

  def response
    div tab_content_attributes do
      yield_components
    end
  end

  protected

  def tab_content_attributes
    html_attributes.merge(
      id: "tab-#{id}-content",
      class: tab_content_classes,
      attributes: { role: "tabpanel", "aria-labelledby": "tab-#{id}" }
    )
  end

  def tab_content_classes
    [].tap do |classes|
      classes << 'tab-pane'
      classes << 'fade'
      classes << 'show ' if active
      classes << 'active' if active
      classes << bs_class
    end.join(' ').strip
  end
end
