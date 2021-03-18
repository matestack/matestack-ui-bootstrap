class Matestack::Ui::Bootstrap::Components::Card < Matestack::Ui::Bootstrap::BaseComponent

  optional :class

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
      if context.header || context.slots && context.slots[:header]
        header_partial
      end

      img_partial :top unless context.img_pos == :bottom
      div class: context.content_wrapper_class do
        body_partial if context.title || context.body || context.slots && context.slots[:body]

        # custom body components
        # needed a div otherwise it will be displayed below footer
        div class: "p-3 pt-1" do yield if block_given? end

        img_partial :bottom if context.img_pos == :bottom

        footer_partial if context.footer || context.slots && context.slots[:footer]
      end
    end
  end

  protected

  def header_partial
    header = self.context.header.is_a?(Hash) ? self.context.header : { text: self.context.header }
    div class: "card-header #{context.header[:class]}" do
      plain context.header[:text] if context.header[:text].present?
      slot context.slots[:header] if context.slots && context.slots[:header]
    end
  end

  def body_partial
    div class: "card-body" do
      # title
      card_title(context.title, "card-title")
      # subtitle
      card_title(context.subtitle, 6, "card-subtitle text-muted")
      # body
      if context.body.is_a? Hash
        paragraph class: "card-text #{body[:class]}" do
          plain context.body[:text]
        end
      elsif context.body
        paragraph class: "card-text" do
          plain body
        end
      end
      slot context.slots[:body] if context.slots && context.slots[:body]
    end
  end

  def footer_partial
    footer = self.context.footer.is_a?(Hash) ? self.context.footer : { text: self.context.footer }
    div class: "card-footer #{context.footer[:class]}" do
      plain context.footer[:text] if context.footer[:text].present?
      slot context.slots[:footer] if context.slots && context.slots[:footer]
    end
  end

  def img_partial pos
    img class: "card-img-#{pos}", path: context.img_path, alt: context.alt_text if context.img_path.present?
  end

  def card_attributes
    options.merge(
      class: card_classes
    )
  end

  def card_classes
    [].tap do |classes|
      classes << 'card'
      classes << context.class
    end.join(' ').strip
  end

  def card_title(options, default_size = 5, title_class)
    if options.is_a? Hash
      heading size: (context.size || default_size), class: "#{context.class} #{title_class}",
        plain context.text
    elsif options
      heading size: default_size, class: title_class do
        plain options
      end
    end
  end

end
