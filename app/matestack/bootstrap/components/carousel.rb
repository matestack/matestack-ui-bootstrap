class Bootstrap::Components::Carousel < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-carousel" 
  
  optional :start, :controls, :indicators, :fade 
  optional :items, class: { as: :bs_class }
  # event trigger
  optional :cycle_on, :pause_on, :prev_on, :next_on

  def setup
    @component_config["carousel-id"] = carousel_id
  end
  
  def response
    div carousel_attributes do
      # carousel indicator
      indicator_partial if indicators.present?
      # carousel content
      div class: "carousel-inner" do
        yield_components
        carousel_partial if items
      end
      controls_partial if controls
    end
  end

  protected

  def indicator_partial
    ol class: "carousel-indicators" do
      items.size.times do |index|
        li data: { target: carousel_id, 'slide-to': index }, 
          class: "#{'active' if index == (start || 0) }"
      end
    end
  end

  def carousel_partial
    items.each_with_index do |item, index|
      div class: "carousel-item #{'active' if index == (start || 0) }", 
        data: { interval: item[:interval] } do
        img class: "d-block w-100", path: item[:path]
        if item[:title] || item[:text]
          div class: "carousel-caption d-none d-md-block" do
            heading size: 5, text: item[:title]
            paragraph text: item[:text]
          end
        end
      end
    end
  end

  def controls_partial
    link class: "carousel-control-prev", path: "##{carousel_id}", data: { slide: :prev }, attributes: { 'role': "button" } do
      span class: "carousel-control-prev-icon", attributes: { 'aria-hidden': "true" }
      span class: "sr-only", text: "Previous"
    end
    link class: "carousel-control-next", path: "##{carousel_id}", data: { slide: :next }, attributes: { 'role': "button" } do
      span class: "carousel-control-next-icon", attributes: { 'aria-hidden': "true" }
      span class: "sr-only", text: "Next"
    end
  end

  def carousel_attributes
    html_attributes.merge(
      id: carousel_id,
      class: carousel_classes,
      data: { ride: 'carousel' }
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

  def carousel_id
    @carousel_id ||= "matestack-carousel-#{SecureRandom.hex}"
  end

end