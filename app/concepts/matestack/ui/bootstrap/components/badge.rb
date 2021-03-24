class Matestack::Ui::Bootstrap::Components::Badge < Matestack::Ui::Bootstrap::BaseComponent

  optional class: { as:  :bs_class }
  optional :text, :variant, :rounded, :visually_hidden

  def response
    span badge_attributes do
      plain context.text if context.text
      yield if block_given?
    end
    span context.visually_hidden, class: "visually-hidden" if context.visually_hidden.present?
  end

  protected

  def badge_attributes
    options.merge(
      class: badge_classes
    )
  end

  def badge_classes
    [].tap do |classes|
      classes << 'badge'
      classes << (context.variant.present? ? "bg-#{context.variant}" : "bg-secondary")
      classes << "rounded-pill" if context.rounded
      classes << context.bs_class
    end.join(' ').strip
  end
end
