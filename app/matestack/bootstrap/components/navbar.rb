class Bootstrap::Components::Navbar < Matestack::Ui::Component

  POS_ATTRIBUTES = %i[fixed_top fixed_bottom sticky_top]
  optional *POS_ATTRIBUTES

  optional class: { as: :bs_class }
  optional :items, :items_class, :theme, :hide_at, :color, :container_size
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
      container size: "#{container_size.present? ? container_size : "fluid" }" do
        # custom elements for navbar
        if options[:slots] && options[:slots][:custom_items]
          slot options[:slots][:custom_items]
        else
          toggle_button if @toggle[:position] == :left
          brand_partial if brand.present?
          toggle_button if !@toggle[:position].present? || @toggle[:position] == :right
          navbar_content_partial if items.present?
        end
      end
    end
  end

  protected

  def brand_partial
    brand = self.brand.is_a?(Hash) ? self.brand : { text: self.brand }
    path = brand[:path].present? ? brand[:path] : "/"
    link class: "navbar-brand", path: path do 
      plain brand[:text]
      img path: brand[:img], attributes: { loading: "lazy" } if brand[:img].present?
    end
  end

  def navbar_content_partial
    div class: "collapse navbar-collapse", id: 'matestackNavbarContent' do
      ul class: items_classes do
        items.each do |item|
          li class: "nav-item" do
            if item[:type] == :link
              link class: "nav-link", path: item[:path], text: item[:text]
            else
              transition class: "nav-link", path: item[:path], text: item[:text]
            end
          end
        end
      end
      yield_components
    end
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
      classes << "navbar-expand-#{ (hide_at.present? ? hide_at : "lg") }"
      classes << "navbar-#{theme}" if  theme.present?
      classes << (color.present? ? "bg-#{color}" : "bg-#{theme}") if theme || color
      classes << bs_class
    end.join(' ').strip
  end

  def toggle_button
    button toggle_attributes do
      span class: "navbar-toggler-icon"
    end
  end

  def toggle_attributes
    toggle_classes = [].tap do |classes|
      classes << 'navbar-toggler'
      classes << "ml-auto" if @toggle[:position] == :right
      classes << "mr-auto" if @toggle[:position] == :left
      classes << @toggle[:class] if @toggle[:class]
    end.join(' ').strip

    {}.tap do |hash|
      hash[:class] = toggle_classes
      hash[:data] = { toggle: 'collapse', target: '#matestackNavbarContent' }
      hash[:attributes] = { 'aria-controls': 'matestackNavbarContent', 'aria-expanded': 'false', 'aria-label': 'Toggle navigation' }
    end
  end

  def items_classes
    [].tap do |classes|
      classes << 'navbar-nav'
      classes << (items_class.present? ? items_class : "mr-auto mb-2 mb-lg-0")
      classes << "align-items-center ml-auto" unless items_class.present?
    end.join(' ').strip
  end
end