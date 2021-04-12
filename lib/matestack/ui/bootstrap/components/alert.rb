require_relative "../base_vue_js_component"

class Matestack::Ui::Bootstrap::Components::Alert < Matestack::Ui::Bootstrap::BaseVueJsComponent
  vue_name "matestack-ui-bootstrap-alert"

  optional :title, :variant, :dismissible, :animate, :title_size, class: { as:  :bs_class }
  optional :close_on, :dispose_on # event names on which occourences we close or dispose the modal

  def response
    div alert_attributes do
      heading context.title, size: (context.title_size || 4), class: 'alert-heading' if context.title
      plain context.text if context.text
      yield if block_given?
      bs_close dismiss: "alert" if context.dismissible
    end
  end

  protected

  def vue_props
    {}.tap do |props|
      props[:close_on] = context.close_on
      props[:dispose_on] = context.dispose_on
    end
  end

  def alert_classes
    classes = ['alert']
    classes << "alert-#{context.variant || "primary"}"
    classes << "alert-dismissible" if context.dismissible
    classes << "fade show" if context.animate
    classes << context.bs_class
    classes.join(' ')
  end

  def alert_attributes
    {}.tap do |attrs|
      attrs[:class] = alert_classes,
      attrs[:role] = :alert
    end
  end

end
