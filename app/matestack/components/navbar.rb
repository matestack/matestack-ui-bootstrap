class Components::Navbar < Matestack::Ui::StaticComponent
  def prepare
    @list_items = @options[:list] 
  end
  def response 
    nav id: @options[:id], class: navbar_classes do
      container size: container_classes do
        # custom elements for navbar
        if options[:slots] && options[:slots][:custom_items]
          slot options[:slots][:custom_items]
        else
        # pre-define standard element: brand, link list
          toggle_button if @options[:toggle_pos].present? && @options[:toggle_pos] == :left
          if @options[:brand].present?            
            @options[:brand].each do |path, content|
              link class: "navbar-brand", path: "#{path}" do plain content end
            end
          end

          toggle_button if !@options[:toggle_pos].present? || @options[:toggle_pos] == :right
          
          div class: "collapse navbar-collapse", id: 'matestackNavbarContent' do
            if @options[:list].present?
              ul class: "navbar-nav #{list_classes}" do
                @list_items.each do |key, item|
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
            end
            yield_components
          end
        end
      end
    end
  end

  protected

  def toggle_button
    button class: "navbar-toggler", attributes: { 'data-toggle': 'collapse', 'data-target': '#matestackNavbarContent', 'aria-controls': 'matestackNavbarContent', 'aria-expanded': 'false', 'aria-label': 'Toggle navigation' } do
      span class: "navbar-toggler-icon"
    end
  end

  def navbar_classes
    classes = []
    classes << "navbar"
    [:fixed_top, :fixed_bottom, :sticky_top].each do |pos| 
      classes << "#{pos}".gsub('_','-') if @options[pos].present? && @options[pos]
    end
    classes << "navbar-expand-#{@options[:hide_at]}" if @options[:hide_at].present?
    classes << "navbar-#{@options[:theme]}" if  @options[:theme].present?
    @options[:color].present? ? classes << "bg-#{@options[:color]}" : classes << "bg-#{@options[:theme]}"
    classes << @options[:class]
    classes.join(' ') 
  end

  def list_classes
    classes = []
    classes << "mr-auto" if @options[:list_align].present? && @options[:list_align] == :left
    classes << "ml-auto" if @options[:list_align].present? && @options[:list_align] == :right
    classes << @options[:list_class]
    classes << "align-items-center" unless @options[:list_class].present?
    classes.join(' ') 
  end

  def container_classes
    attrs = @options[:container_size].present? ? "#{@options[:container_size]}" : "fluid"
    attrs 
  end
end