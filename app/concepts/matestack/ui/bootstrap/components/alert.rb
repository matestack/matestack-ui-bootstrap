class Matestack::Ui::Bootstrap::Components::Alert < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-alert"

  optional :title, :text, :variant, :dismissible, :animate, :title_size, class: { as: :bs_class }
  optional :close_on, :dispose_on # event names on which occourences we close or dispose the modal

  def response
    div alert_attributes do
      heading size: (title_size || 4), class: 'alert-heading', text: title if title
      paragraph text: text if text
      yield_components
      bs_close dismiss: "alert" if dismissible
    end
  end

  protected

  def alert_classes
    classes = ['alert']
    classes << "alert-#{variant || "primary"}"
    classes << "alert-dismissible" if dismissible
    classes << "fade show" if animate
    classes << bs_class
    classes.join(' ')
  end

  def alert_attributes
    html_attributes.merge(
      class: alert_classes,
      attributes: { role: :alert }
    )
  end

end
