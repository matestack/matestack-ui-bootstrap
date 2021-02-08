class Bootstrap::Components::Card < Matestack::Ui::Component

  optional class: { as: :bs_class }

  # header attributes, expects a hash or string
  # possible keys `:class, :text`
  optional :header
  # footer attributes, expects a hash or string
  # possible keys `:class, :text`
  optional :footer

  optional :title, :body, :subtitle # body attributes
  optional :img_path, :img_pos, :alt_text # image attributes

  optional :content_wrapper_class # class for content wrapper -> useful for content padding without affecting top image

  optional :slots # passed in slots for card header or footer

  def response
    div card_attributes do
      if header || slots && slots[:header]
        header_partial
      end

      img_partial :top unless img_pos == :bottom
      div class: content_wrapper_class do
        body_partial if title || body || slots && slots[:body]

        # custom body components
        # needed a div otherwise it will be displayed below footer
        div class: "p-3 pt-1" do yield_components end

        img_partial :bottom if img_pos == :bottom

        footer_partial if footer || slots && slots[:footer]
      end
    end
  end

  protected

  def header_partial
    header = self.header.is_a?(Hash) ? self.header : { text: self.header }
    div class: "card-header #{header[:class]}" do
      plain header[:text] if header[:text].present?
      slot slots[:header] if slots && slots[:header]
    end
  end

  def body_partial
    div class: "card-body" do
      # title
      card_title(title, "card-title")
      # subtitle
      card_title(subtitle, 6, "card-subtitle text-muted")
      # body
      if body.is_a? Hash
        paragraph class: "card-text #{body[:class]}", text: body[:text]
      elsif body
        paragraph class: "card-text", text: body
      end
      slot slots[:body] if slots && slots[:body]
    end
  end

  def footer_partial
    footer = self.footer.is_a?(Hash) ? self.footer : { text: self.footer }
    div class: "card-footer #{footer[:class]}" do
      plain footer[:text] if footer[:text].present?
      slot slots[:footer] if slots && slots[:footer]
    end
  end

  def img_partial pos
    img class: "card-img-#{pos}", path: img_path, alt: alt_text if img_path.present?
  end

  def card_attributes
    html_attributes.except(:title).merge(
      class: card_classes
    )
  end

  def card_classes
    [].tap do |classes|
      classes << 'card'
      classes << bs_class
    end.join(' ').strip
  end

  def card_title(options, default_size = 5, title_class)
    if options.is_a? Hash
      heading size: (options[:size] || default_size), class: "#{options[:class]} #{title_class}",
        text: options[:text]
    elsif options
      heading size: default_size, class: title_class, text: options
    end
  end

end
