class Components::Badge < Matestack::Ui::StaticComponent
  
  optional class: { as: :bs_class }
  optional :text, :color, :rounded
  def response
    span badge_attributes do
      plain text if text
      yield_components
    end
  end

  protected

  def badge_attributes
    html_attributes.merge(
      class: badge_classes
    )
  end

  def badge_classes
    [].tap do |classes|
      classes << 'badge'
      classes << (color.present? ? "bg-#{color}" : "bg-primary")
      classes << "rounded-pill" if rounded
      classes << bs_class
    end.join(' ').strip
  end
end