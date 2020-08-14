class Components::Dynamic::Carousel < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-carousel" 

  def setup
    @carousel_id = "matestack-carousel-#{SecureRandom.hex}"
    @component_config["carousel-id"] = @carousel_id
  end
  
  def prepare
    # Expecting an array with image paths
    @items = @options[:items] 
  end

  def response
    div id: @carousel_id, class: "#{container_classes}", data: carousel_data, attributes: carousel_attributes, do

      if @options[:with_indicator].present? && @options[:with_indicator]
        ol class: "carousel-indicators" do
          @items.each_with_index do |item, index|
            li attributes: { 'data-target':"#{@carousel_id}", 'data-slide-to':"#{index}" }, class: "#{'active' if index == 0 }"
        end
      end

      div class: "carousel-inner" do
        @items.each do |path|
          div class: "carousel-item" do
            img class: "d-block w-100", path: path
          end
        end
      end
      if @options[:with_control].present? && @options[:with_control]
        link class: "carousel-control-prev", path: "##{@carousel_id}", attributes: { 'role':"button", 'data-slide':"prev" } do
          span class: "carousel-control-prev-icon", attributes: { 'aria-hidden':"true" }
          span class: "sr-only", text: "Previous"
        end
        link class: "carousel-control-next", path: "##{@carousel_id}", attributes: { 'role':"button", 'data-slide':"next" } do
          span class: "carousel-control-next-icon", attributes: { 'aria-hidden':"true" }
          span class: "sr-only", text: "Next"
        end
      end
      yield_components
    end
  end

  protected

  def carousel_attributes
    attrs = @options[:attributes] || {}
    attrs[:ride] = 'carousel'
    attrs
  end

  def carousel_data
    attrs = @options[:data] || {}
    attrs
  end

  def carousel_classes
    classes = []

    classes << "carousel slide"
    classes << @options[:class]
    classes.join(' ')
  end
end