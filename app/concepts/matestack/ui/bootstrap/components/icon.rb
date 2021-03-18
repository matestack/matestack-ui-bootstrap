class Matestack::Ui::Bootstrap::Components::Icon < Matestack::Ui::Bootstrap::BaseComponent

  required :name
  optional :size
  optional :class

  def response
    plain " <svg class='bi #{context.class}' width='#{get_size}' height='#{get_size}' fill='currentColor'>
              <use xlink:href='#{image_url("icons/bootstrap-icons.svg")}##{context.name}'/>
            </svg>".html_safe
  end

  def get_size
    context.size || 20
  end



end
