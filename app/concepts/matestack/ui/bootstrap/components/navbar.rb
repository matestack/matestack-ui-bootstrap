class Matestack::Ui::Bootstrap::Components::Navbar < Matestack::Ui::Component

  POS_ATTRIBUTES = %i[fixed_top fixed_bottom sticky_top]
  optional *POS_ATTRIBUTES

  optional class: { as: :bs_class }
  optional :items, :items_class, :theme, :expand_at, :color, :container_size
  optional :collapse_class
  # brand expect hash or string, possible keys for hash: text, path, img
  optional :brand
  # toogle expect hash or a symbol (:left or :right),
  # possible keys for hash: position, class
  optional :toggle

  def prepare
    @toggle = self.toggle.is_a?(Hash) ? self.toggle : { position: self.toggle }
  end

  def response
    nav navbar_attributes do
      bs_container size: "#{container_size.present? ? container_size : "fluid" }" do
        # custom elements for navbar
        if options[:slots] && options[:slots][:custom_items]
          slot options[:slots][:custom_items]
        else
          toggle_button if @toggle[:position] == :left
          brand_partial
          toggle_button if !@toggle[:position].present? || @toggle[:position] == :right
          navbar_content_partial
        end
      end
    end
  end

  protected

  def brand_partial
    brand = self.brand.is_a?(Hash) ? self.brand : { text: self.brand }
    path = brand[:path].present? ? brand[:path] : "/"
    brand[:path] = path
    case brand[:type]
    when :link
      link brand.except(:text).merge(class: "navbar-brand") do
        img height: 40, path: brand[:img], attributes: { loading: "lazy" } if brand[:img].present?
        plain brand[:text]
      end
    else
      transition brand.except(:text).merge(class: "navbar-brand") do
        img height: 40, path: brand[:img], attributes: { loading: "lazy" } if brand[:img].present?
        plain brand[:text]
      end
    end
  end

  def navbar_content_partial
    div class: "collapse navbar-collapse #{collapse_class}", id: 'matestackNavbarContent' do
      if items.present?
        ul class: items_classes do
          items.each do |item|
            li class: "nav-item" do
              case item[:type]
              when :link
                link link_config(item)  do
                  bs_icon name: item[:icon], size: 20 if item[:icon]
                  span class: "ps-3", text: item[:text] if item[:text]
                end
              when :action
                action action_config(item) do
                  bs_icon name: item[:icon], size: 20 if item[:icon]
                  span class: "ps-3", text: item[:text] if item[:text]
                end
              else
                transition transition_config(item) do
                  bs_icon name: item[:icon], size: 20 if item[:icon]
                  span class: "ps-3", text: item[:text] if item[:text]
                end
              end
            end
          end
        end
      end
      yield_components
    end
  end

  def link_config(item)
    config = item.except(:text)
    config[:class] = "nav-link"
    config
  end

  def transition_config(item)
    config = item.except(:text)
    config[:class] = "nav-link"
    config
  end

  def action_config(item)
    config = item.except(:text)
    config[:class] = "nav-link"
    config
  end

  def navbar_attributes
    html_attributes.merge(
      class: navbar_classes
    )
  end

  def navbar_classes
    [].tap do |classes|
      classes << "navbar"
      POS_ATTRIBUTES.each do |pos|
        classes << "#{pos}".gsub('_','-') if self.send("#{pos}")
      end
      classes << "navbar-expand-#{ (expand_at.present? ? expand_at : "lg") }"
      classes << "navbar-#{theme}" if  theme.present?
      classes << (color.present? ? "bg-#{color}" : "bg-#{theme}") if theme || color
      classes << bs_class
    end.join(' ').strip
  end

  def toggle_button
    button toggle_attributes do
      bs_icon name: "list", size: 25, class: "text-muted"
    end
    # button toggle_attributes do
    #   span class: "navbar-toggler-icon"
    # end
  end

  def toggle_attributes
    toggle_classes = [].tap do |classes|
      classes << 'btn btn-link navbar-toggler'
      classes << "ms-auto" if @toggle[:position] == :right
      classes << "me-auto" if @toggle[:position] == :left
      classes << @toggle[:class] if @toggle[:class]
    end.join(' ').strip

    {}.tap do |hash|
      hash[:class] = toggle_classes
      hash[:data] = { "bs-toggle": 'collapse', "bs-target": '#matestackNavbarContent' }
      hash[:attributes] = { 'aria-controls': 'matestackNavbarContent', 'aria-expanded': 'false', 'aria-label': 'Toggle navigation' }
    end
  end

  def items_classes
    [].tap do |classes|
      classes << 'navbar-nav'
      classes << (items_class.present? ? items_class : "ms-auto mb-2 mb-lg-0")
      # classes << "ms-auto" unless items_class.present?
    end.join(' ').strip
  end
end
