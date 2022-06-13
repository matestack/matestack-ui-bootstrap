require_relative "../base_vue_js_component"

class Matestack::Ui::Bootstrap::Components::Offcanvas < Matestack::Ui::Bootstrap::BaseVueJsComponent

  vue_name 'matestack-ui-bootstrap-offcanvas'

  optional :id
  optional class: { as:  :bs_class }
  optional :placement # start, end, top, bottom - default: start
  optional :scroll # true, false - default: false
  optional :backdrop # true, false - default: true
  optional :static_title # any string - default: ""

  optional :toggle_on, :show_on, :hide_on, :handle_update_on, :dispose_on


  def response
    div offcanvas_attributes do
      div class: "offcanvas-header" do
        h5 class:"offcanvas-title", id: "#{context.id}Label", text: "#{context.static_title}"
        button type: "button", class:"btn-close", "data-bs-dismiss": "offcanvas", "aria-label": "Close"
      end
      div class:"offcanvas-body" do
        yield
      end
    end
  end

  protected

  def offcanvas_attributes
    attributes = {}.tap do |hash|
      hash[:id] = context.id
      hash[:class] = offcanvas_classes
      hash[:attributes] = { 'tabindex': "-1", 'aria-labelledby': "#{context.id}Label" }
      hash[:data] = {}.tap do |data|
        data["bs-scroll"] = "#{context.scroll&.to_s || "false"}"
        data["bs-backdrop"] = "#{context.backdrop&.to_s || "true"}"
      end
    end
    options.merge(
      attributes
    )
  end

  def offcanvas_classes
    [].tap do |classes|
      classes << "offcanvas offcanvas-#{context.placement || 'start'}"
      classes << context.bs_class
    end.join(' ').strip
  end

  def vue_props
    {}.tap do |props|
      props[:toggle_on] = context.toggle_on
      props[:show_on] = context.show_on
      props[:hide_on] = context.hide_on
    end
  end

end
