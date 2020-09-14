class Bootstrap::Components::Spinner < Matestack::Ui::Component

  optional class: { as: :bs_class }
  optional :type, :color, :smaller

  def response 
    div spinner_attributes do
      span class: "sr-only", text: "Loading..."
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
      spinner_type = (type.present? ? type : 'border')
      classes << "spinner-#{spinner_type}" 
      classes << "text-#{color}"  if color.present?
      classes << "spinner-#{spinner_type}-sm" if smaller
      #optional classes
      classes << bs_class
    end.join(' ').strip
  end
end