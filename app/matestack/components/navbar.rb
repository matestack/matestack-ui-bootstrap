class Components::Navbar < Matestack::Ui::StaticComponent

  POS_ATTRIBUTES = %i[fixed_top fixed_bottom sticky_top]
  optional *POS_ATTRIBUTES

  optional class: { as: :bs_class }
  optional :items, :toggle_pos, :theme, :hide_at, :color
  optional :brand_img, :brand_path, :brand_text
  optional :list_class, :toggle_class, :container_size

  def response 
    nav navbar_attributes do
      container size: "#{container_size.present? ? container_size : "fluid" }" do
        # custom elements for navbar
        if options[:slots] && options[:slots][:custom_items]
          slot options[:slots][:custom_items]
        else
          toggle_button if toggle_pos == :left
          brand_partial if brand_text || brand_img
          toggle_button if !toggle_pos.present? || toggle_pos == :right
          
          navbar_content_partial
        end
      end
    end
  end

  protected

  def brand_partial
    link class: "navbar-brand", path: brand_path do 
      plain brand_text if brand_text.present?
      img path: brand_img, attributes: { loading: "lazy" } if brand_img.present?
    end
  end

  def navbar_content_partial
    div class: "collapse navbar-collapse", id: 'matestackNavbarContent' do
      ul class: list_classes do
        items.each do |key, item|
          li class: "nav-item" do
            if item[:type] == :transition
              transition class: "nav-link", path: item[:path], text: item[:text]
            end
            if item[:type] == :link
              link class: "nav-link", path: item[:path], text: item[:text]
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
      classes << (color.present? ? "bg-#{color}" : "bg-#{theme}")
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
      classes << "ml-auto" if toggle_pos == :right
      classes << "mr-auto" if toggle_pos == :left
      classes << toggle_class
    end.join(' ').strip

    {}.tap do |hash|
      hash[:class] = toggle_classes
      hash[:data] = { toggle: 'collapse', target: '#matestackNavbarContent' }
      hash[:attributes] = { 'aria-controls': 'matestackNavbarContent', 'aria-expanded': 'false', 'aria-label': 'Toggle navigation' }
    end
  end

  def list_classes
    [].tap do |classes|
      classes << 'navbar-nav'
      classes << list_class
      classes << "align-items-center ml-auto" unless list_class.present?
    end.join(' ').strip
  end
end