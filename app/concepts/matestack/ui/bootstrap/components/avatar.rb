class Matestack::Ui::Bootstrap::Components::Avatar < Matestack::Ui::Bootstrap::BaseComponent

  optional :text, :bg_variant, :text_variant, :img_path, :size, class: { as:  :bs_class }

  def response
    if context.text.present? && context.img_path.nil?
      div class: "rounded-circle bg-#{context.bg_variant || 'primary'} text-#{context.text_variant || 'white'} text-center p-2 #{context.bs_class}", 
        style: "height: #{height}px; width: #{width}px; display: inline-block;" do
        plain context.text
      end
    else
      div class: "rounded-circle text-#{context.text_variant || 'white'} text-center p-2 #{context.bs_class}", 
        style: "height: #{height}px; width: #{width}px; display: inline-block; background-image: url(#{context.img_path}); background-size: contain;" do
        plain context.text
      end
    end
  end

  def height
    context.size || 40
  end

  def width
    context.size || 40
  end

end
