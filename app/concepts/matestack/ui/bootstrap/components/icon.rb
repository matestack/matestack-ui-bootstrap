class Matestack::Ui::Bootstrap::Components::Icon < Matestack::Ui::Component

  requires :name
  optional :size
  optional class: { as: :bs_class }

  def response
    plain " <svg class='bi #{bs_class}' width='#{get_size}' height='#{get_size}' fill='currentColor'>
              <use xlink:href='#{image_url("icons/bootstrap-icons.svg")}##{name}'/>
            </svg>".html_safe
  end

  def get_size
    size || 20
  end



end
