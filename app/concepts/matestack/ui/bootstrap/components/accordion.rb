class Matestack::Ui::Bootstrap::Components::Accordion < Matestack::Ui::Component

  # [ {header: { class, id, text, size, btn_variant, btn_class }, body: { class, text, multi } } ]
  optional :items # array with 2 Hashes: header and body
  optional :open
  optional :variant
  optional attributes: { as: :bs_attrs }, class: { as: :bs_class }, id: { as: :bs_id }

  def setup
    @accordion_id = (bs_id.present? ? bs_id : "matestack-accordion-#{SecureRandom.hex(3)}")
  end

  def response
    div accordion_attributes do
      accordion_content_partial if items.present?
      yield_components
    end
  end

  protected

  def accordion_content_partial
    items.each_with_index do | item, index |
      div class: "accordion-item" do
        heading class: "accordion-header #{item[:header][:class]}", id: (item[:header][:id] || "header-#{index}"), size: (item[:header][:size] || 2) do
          button class: "accordion-button", text:item[:header][:text],
            data: { "bs-toggle": "collapse", "bs-target": "#collapse-#{(item[:header][:id] || "header-#{index}") }" },
            attributes: { "aria-expanded": "false", "aria-controls": "collapse-#{(item[:header][:id] || "header-#{index}")}", type: "button" }
        end
        bs_collapse class: "accordion-collapse #{ 'show' if open || item[:open] }", id: "collapse-#{(item[:header][:id] || "header-#{index}")}", labelledby: (item[:header][:id] || "header-#{index}"),
          parent: @accordion_id, multi: (item[:body][:multi] || false) do
            div class: "accordion-body #{item[:body][:class]}" do
              plain item[:body][:text]
            end
        end
      end
    end
  end

  def accordion_attributes
    html_attributes.merge(
      id: @accordion_id,
      class: accordion_classes,
      attributes: bs_attrs
    )
  end

  def accordion_classes
    [].tap do |classes|
      classes << 'accordion'
      classes << 'open' if open
      classes << 'accordion-flush' if variant == :flush
      classes << bs_class
    end.join(' ').strip
  end
end
