class Matestack::Ui::Bootstrap::Components::Accordion < Matestack::Ui::Bootstrap::BaseComponent

  # [ {header: { class, id, text, size, btn_variant, btn_class }, body: { class, text, multi } } ]
  optional :items # array with 2 Hashes: header and body
  optional :open
  optional :variant
  optional :attributes, class: { as:  :bs_class }
  optional :id

  def prepare
    @accordion_id = (context.id.present? ? context.id : "matestack-accordion-#{SecureRandom.hex(3)}")
  end

  def response
    div accordion_attributes do
      accordion_content_partial if context.items.present?
      yield if block_given?
    end
  end

  protected

  def accordion_content_partial
    context.items.each_with_index do | item, index |
      div class: "accordion-item" do
        heading class: "accordion-header #{item[:header][:class]}", id: (item[:header][:id] || "header-#{index}"), size: (item[:header][:size] || 2) do
          button class: "accordion-button", text:item[:header][:text],
            data: { "bs-toggle": "collapse", "bs-target": "#collapse-#{(item[:header][:id] || "header-#{index}") }" },
            "aria-expanded": "false", "aria-controls": "collapse-#{(item[:header][:id] || "header-#{index}")}", type: "button"
        end
        bs_collapse class: "accordion-collapse #{ 'show' if context.open || item[:open] }", id: "collapse-#{(item[:header][:id] || "header-#{index}")}", labelledby: (item[:header][:id] || "header-#{index}"),
          parent: @accordion_id, multi: (item[:body][:multi] || false) do
            div class: "accordion-body #{item[:body][:class]}" do
              plain item[:body][:text]
            end
        end
      end
    end
  end

  def accordion_attributes
    options.merge(
      id: @accordion_id,
      class: accordion_classes
      ).merge(context.attributes || {})
  end

  def accordion_classes
    [].tap do |classes|
      classes << 'accordion'
      classes << 'open' if context.open
      classes << 'accordion-flush' if context.variant == :flush
      classes << context.bs_class
    end.join(' ').strip
  end
end
