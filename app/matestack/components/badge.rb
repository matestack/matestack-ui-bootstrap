class Components::Badge < Matestack::Ui::StaticComponent
  
  def response
    span id: "#{options[:id]}", class: "badge #{badge_classes}" do
      plain @options[:text] 
    end
  end

  def badge_classes
    badge_classes = []
    badge_classes << options[:class]

    options[:color].present? ? badge_classes << "bg-#{options[:color]}" : badge_classes << "bg-primary"
    badge_classes << "rounded-pill" if @options[:type] == :round
    badge_classes.join(' ')
  end
end