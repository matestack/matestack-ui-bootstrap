class Matestack::Ui::Bootstrap::Components::Badge < Matestack::Ui::Component

  optional class: { as: :bs_class }
  optional :text, :variant, :rounded, :visually_hidden

  def response
    span badge_attributes do
      plain text if text
      yield_components
    end
    span class: "visually-hidden", text: visually_hidden if visually_hidden.present?
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
      classes << (variant.present? ? "bg-#{variant}" : "bg-secondary")
      classes << "rounded-pill" if rounded
      classes << bs_class
    end.join(' ').strip
  end
end
