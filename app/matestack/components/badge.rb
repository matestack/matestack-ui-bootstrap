class Components::Badge < Matestack::Ui::StaticComponent
  
  def response
    span id: "#{options[:id]}", class: "badge #{badge_classes}" do
      plain @options[:text] 
    end
  end

  def badge_classes
    badge_classes = []

    bg_color = @options[:color].present? ? "bg-#{@options[:color]}" : "bg-primary"
    badge_classes << bg_color

    badge_classes << "rounded-pill" if @options[:type] == :round
    badge_classes << @options[:class]
    badge_classes.join(' ')
  end
end