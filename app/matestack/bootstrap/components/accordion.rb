class Bootstrap::Components::Accordion < Matestack::Ui::Component

  # [ {header: { class, id, text, size, btn_variant, btn_class }, body: { class, text, multi } } ]
  optional :items # array with 2 Hashes: header and body 
  optional attributes: { as: :bs_attrs }, class: { as: :bs_class }, id: { as: :bs_id }

  def setup
    @accordion_id = (bs_id.present? ? bs_id : "matestack-accordion-#{SecureRandom.hex(3)}")
  end
  def response 
    div accordion_attributes do
      div class: "card" do
        accordion_content_partial if items.present?
        yield_components
      end
    end
  end

  protected

  def accordion_content_partial
    items.each_with_index do | item, index |
      div class: "card-header p-0 #{item[:header][:class]}", id: (item[:header][:id] || "header-#{index}") do
        heading size: (item[:header][:size] || 2), class: "mb-0" do
          btn variant: (item[:header][:variant] || :link), size: :block, class: (item[:header][:class] || "text-left"), text:item[:header][:text], 
                data: { toggle: "collapse", target: "#collapse-#{(item[:header][:id] || "header-#{index}") }" }, 
                attributes: { "aria-expanded": "false", "aria-controls": "collapse-#{(item[:header][:id] || "header-#{index}")}" }
        end
      end
      collapse id: "collapse-#{(item[:header][:id] || "header-#{index}")}", labelledby: (item[:header][:id] || "header-#{index}"), 
              parent: @accordion_id, multi: (item[:body][:multi] || false) do
        div class: "card-body #{item[:body][:class]}" do
          plain item[:body][:text]
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
      classes << bs_class
    end.join(' ').strip
  end
end