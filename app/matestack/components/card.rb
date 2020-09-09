class Components::Card < Matestack::Ui::StaticComponent

  optional class: { as: :bs_class }
  optional :header_class, :header_text, :hide_header # header attributes
  optional :title, :text, :img_path, :img_pos, :alt_text # body attributes
  optional :footer_class, :footer_text, :hide_footer # footer attributes

  def response
    div card_attributes do
      header_partial if !hide_header

      img_partial :top if img_pos != :bottom
      body_partial
      # custom body components
      yield_components
      img_partial :bottom if img_pos == :bottom

      footer_partial if !hide_footer
    end
  end

  protected

  def header_partial
    div class: "card-header #{header_class}" do
      slot options[:slots][:header] if options[:slots] && options[:slots][:header]
      plain header_text if header_text.present?
    end
  end

  def body_partial
    div class: "card-body" do
      heading size: title_size, class: 'card-title', text: title if title.present?
      paragraph class: "card-text", text: text if text.present?
      slot options[:slots][:body] if options[:slots] && options[:slots][:body]
    end
  end

  def footer_partial
    div class: "card-footer #{footer_class}" do
      slot options[:slots][:footer] if options[:slots] && options[:slots][:footer]
      plain footer_text if footer_text.present?
    end
  end

  def img_partial pos
    img class: "card-img-#{pos}", path: img_path, alt: alt_text if img_path.present?
  end

  def card_attributes
    html_attributes.merge(
      class: card_classes
    )
  end

  def card_classes
    [].tap do |classes|
      classes << 'card'
      classes << bs_class
    end.join(' ').strip
  end

  def title_size
    attrs = options[:title_size].present? ? options[:title_size] : 5
    attrs
  end
end