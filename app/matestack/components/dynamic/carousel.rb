class Components::Dynamic::Carousel < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-carousel" 
  
  optional :items, :indicator, :control, :fade, class: { as: :bs_class }

  def setup
    @carousel_id = "matestack-carousel-#{SecureRandom.hex}"
    @component_config["carousel-id"] = @carousel_id
  end
  
  def prepare
    # Expecting an array with image paths, title, text & intervals int
    @items = items
    @indicator = indicator
  end

  def response
    div carousel_attributes do

      if indicator.present?
        ol class: "carousel-indicators" do
          @indicator.each_with_index do |item, index|
            li attributes: { 'data-target':"#{@carousel_id}", 'data-slide-to':"#{index}" }, class: "#{'active' if index == 0 }"
          end
        end
      end
      # carousel content
      div class: "carousel-inner" do
        if @items.blank?
          yield_components 
        else
          @items.each_with_index do |(key, item), index|
            div class: "carousel-item #{'active' if index == 0 }", data: { interval:"#{item[:interval]}" } do
              img class: "d-block w-100", path: item[:path]
              div class: "carousel-caption d-none d-md-block" do
                heading size: 5, text: item[:title]
                paragraph text: item[:text]
              end
            end
          end
        end
      end

      if control
        link class: "carousel-control-prev", path: "##{@carousel_id}", attributes: { 'role':"button", 'data-slide':"prev" } do
          span class: "carousel-control-prev-icon", attributes: { 'aria-hidden':"true" }
          span class: "sr-only", text: "Previous"
        end
        link class: "carousel-control-next", path: "##{@carousel_id}", attributes: { 'role':"button", 'data-slide':"next" } do
          span class: "carousel-control-next-icon", attributes: { 'aria-hidden':"true" }
          span class: "sr-only", text: "Next"
        end
      end
    end
  end

  protected

  def carousel_attributes
    html_attributes.merge(
      id: @carousel_id,
      class: carousel_classes,
      attributes: { 'data-ride':"carousel" }
    )
  end

  def carousel_classes
    [].tap do |classes|
      classes << 'carousel slide'
      classes << 'carousel-fade' if fade
      #custom classes 
      classes << bs_class
    end.join(' ').strip
  end

end