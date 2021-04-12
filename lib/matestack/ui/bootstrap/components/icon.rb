require_relative "../base_component"

class Matestack::Ui::Bootstrap::Components::Icon < Matestack::Ui::Bootstrap::BaseComponent

  required :name
  optional :size
  optional class: { as:  :bs_class }

  def response
    svg class: "bi #{context.bs_class}", width: get_size, height: get_size, fill: 'currentColor' do
      unescape("<use xlink:href='#{asset_path("icons/bootstrap-icons.svg")}##{context.name}'/>")
    end
  end

  def get_size
    context.size || 20
  end



end
