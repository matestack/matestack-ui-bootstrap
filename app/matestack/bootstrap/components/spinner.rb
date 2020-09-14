class Bootstrap::Components::Spinner < Matestack::Ui::Component

  optional class: { as: :bs_class }
  optional :kind, :color, :size, :sr_only

  def response 
    div spinner_attributes do
      span class: "sr-only", text: sr_only || "Loading..."
    end
  end

  protected

  def spinner_attributes
    html_attributes.merge(
      class: spinner_class,
      attributes: { 'role': "status" }
    )
  end

  def spinner_class
    [].tap do |classes|
      spinner_kind = (kind.present? ? kind : 'border')
      classes << "spinner-#{spinner_kind}" 
      classes << "text-#{color}"  if color.present?
      classes << "spinner-#{spinner_kind}-sm" if size
      #optional classes
      classes << bs_class
    end.join(' ').strip
  end
end