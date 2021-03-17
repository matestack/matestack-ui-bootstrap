class Matestack::Ui::Bootstrap::Components::Alert < Matestack::Ui::VueJsComponent
  vue_name "matestack-ui-bootstrap-alert"

  optional :title, :text, :variant, :dismissible, :animate, :title_size, :class
  optional :close_on, :dispose_on # event names on which occourences we close or dispose the modal

  def response
    div alert_attributes do
      heading context.title, size: (title_size || 4), class: 'alert-heading' if context.title
      plain context.text if context.text
      yield
      bs_close dismiss: "alert" if context.dismissible
    end
  end

  protected

  def alert_classes
    classes = ['alert']
    classes << "alert-#{context.variant || "primary"}"
    classes << "alert-dismissible" if context.dismissible
    classes << "fade show" if context.animate
    classes << context.class
    classes.join(' ')
  end

  def alert_attributes
    {}.tap do |attrs|
      attrs.class = alert_classes,
      attrs.role = :alert
    end
  end

end
