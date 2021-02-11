class Matestack::Ui::Bootstrap::Components::Progress < Matestack::Ui::Component
  
  optional class: { as: :bs_class }
  optional :text, :valuemin, :valuemax
  # progress expects a number or a list containing hashes with at least a :value
  # other options are :text, :class, :variant, :striped, :animated, :aria_valuenow
  optional :progress
  # :value
  optional :variant, :striped, :animated, :height

  def response 
    div progress_attributes do
      progress = self.progress.is_a?(Array) ? self.progress : [{ value: self.progress || value, text: self.text }]
      progress.each do |prog|
        progress_bar(prog[:value], valuemin, valuemax, 
          text: prog[:text], klass: prog[:class], variant: prog[:variant] || variant,
          striped: prog[:striped] || striped, animated: prog[:animated] || animated,
          aria_valuenow: prog[:aria_valuenow]
        )
      end
      yield_components
    end
  end

  protected

  def progress_attributes
    attributes = {}.tap do |hash|
      hash[:class] = "progress #{bs_class}".strip
      hash[:attributes] = { style: "height: #{height}px;" } if height 
    end
    html_attributes.merge(
      attributes
    )
  end

  def progress_bar(value, min, max, text: nil, klass: nil, variant: :primary, striped: false, animated: false, aria_valuenow: nil)
    div progress_bar_attributes(value, klass, variant, striped, animated, aria_valuenow) do
      plain text if text      
    end
  end

  def progress_bar_attributes(value, klass, variant, striped, animated, aria_valuenow)
    {
      class: progress_bar_classes(klass, variant, striped, animated),
      attributes: {
        role: :progressbar,
        style: "width: #{value.to_i > 0 ? value : 0}%;",
        'aria-valuenow': aria_valuenow || value || 0,
        'aria-valuemin': valuemin || 0,
        'aria-valuemax': valuemax || 100
      }
    }
  end

  def progress_bar_classes(klass, variant, striped, animated)
    [].tap do |classes|
      classes << 'progress-bar'
      classes << "bg-#{variant || :primary}"
      classes << "progress-bar-striped" if striped
      classes << "progress-bar-animated" if animated
      classes << klass
    end.join(' ').strip
  end
end