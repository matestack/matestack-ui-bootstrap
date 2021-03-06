class Matestack::Ui::Bootstrap::Components::Avatar < Matestack::Ui::Component

  optional :text, :bg_variant, :text_variant, :img_path, :size, class: { as: :bs_class }

  def response
    if text.present? && img_path.nil?
      div class: "rounded-circle bg-#{bg_variant || 'primary'} text-#{text_variant || 'white'} text-center p-2 #{bs_class}",
          attributes: { style: "height: #{height}px; width: #{width}px; display: inline-block;"} do
        plain text
      end
    else
      div class: "rounded-circle text-#{text_variant || 'white'} text-center p-2 #{bs_class}",
          attributes: { style: "height: #{height}px; width: #{width}px; display: inline-block; background-image: url(#{img_path}); background-size: contain;"} do
        plain text
      end
    end
  end

  def height
    size || 40
  end

  def width
    size || 40
  end

end
