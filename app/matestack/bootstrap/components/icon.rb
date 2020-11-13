class Bootstrap::Components::Icon < Matestack::Ui::Component

  requires :name
  optional :size
  optional :additional_classes

  def response
    plain " <svg class='bi #{additional_classes}' width='#{get_size}' height='#{get_size}' fill='currentColor'>
              <use xlink:href='#{asset_pack_url("media/images/icons/bootstrap-icons.svg")}##{name}'/>
            </svg>".html_safe
  end

  def get_size
    size || 20
  end



end
