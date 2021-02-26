class Matestack::Ui::Bootstrap::Components::Tooltip < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-tooltip"

  DATA_ALIAS_ATTRIBUTES = %i[container delay selector html template fallback_placement]

  DATA_ALIAS_ATTRIBUTES.each do |attribute|
    optional "#{attribute}": { as: :"bs_#{attribute}"}
  end

  # TODO:
  # for security reasons the sanitize, sanitizeFn and whiteList options cannot be supplied using data attributes.
  # sanitize sanitize_fn white_list
  # optional :content
  requires :tooltip_title
  optional :tag
  optional class: { as: :bs_class }
  optional id: { as: :bs_id }
  DATA_ATTRIBUTES = %i[text variant animation placement tabindex trigger boundary offset popper_config]
  optional *DATA_ATTRIBUTES

  def response
    case tag
    when :div
      div tooltip_attributes do
        yield_components
      end
    else
      span tooltip_attributes do
        yield_components
      end
    end
  end

  protected

  def tooltip_attributes
    attributes = {}.tap do |hash|
      hash[:class] = tooltip_classes
      hash[:text] = text if text.present?
      hash[:data] = {}.tap do |hash|
        DATA_ALIAS_ATTRIBUTES.each do |attribute|
          hash["bs-#{attribute}"] = self.send(:"bs_#{attribute}") if self.send(:"bs_#{attribute}")
        end
        DATA_ATTRIBUTES.each do |attribute|
          hash["bs-#{attribute}"] = self.send(:"#{attribute}") if self.send(:"#{attribute}")
        end
        hash["bs-toggle"] = "tooltip"
        hash["bs-type"] = tag
        hash["bs-placement"] = "auto" if placement.nil?
        hash["bs-title"] = tooltip_title
      end
    end
    html_attributes.merge(
      attributes
    )
  end

  def tooltip_classes
    [].tap do |classes|
      classes << bs_class
    end.join(' ').strip
  end

end
