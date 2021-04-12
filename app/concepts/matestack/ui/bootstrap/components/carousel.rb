class Matestack::Ui::Bootstrap::Components::Carousel < Matestack::Ui::Bootstrap::BaseVueJsComponent
  vue_name "matestack-ui-bootstrap-carousel"

  optional :start, :controls, :indicators, :fade, :interval, :variant
  optional :items, class: { as:  :bs_class }
  # possible keys for items: path, title, text, interval
  # event trigger
  optional :cycle_on, :pause_on, :prev_on, :next_on

  def response
    div carousel_attributes do
      # carousel indicator
      indicator_partial if context.indicators.present?
      # carousel content
      div class: "carousel-inner" do
        yield if block_given?
        carousel_partial if context.items
      end
      controls_partial if context.controls
    end
  end

  protected

  def vue_props
    {}.tap do |props|
      props["carousel-id"] = carousel_id
      props[:interval] = context.interval
      props[:cycle_on] = context.cycle_on
      props[:pause_on] = context.pause_on
      props[:prev_on] = context.prev_on
      props[:next_on] = context.next_on
    end
  end

  def indicator_partial
    ol class: "carousel-indicators" do
      context.items.size.times do |index|
        li data: { "bs-target": "##{carousel_id}", 'bs-slide-to': index },
          class: "#{'active' if index == (context.start || 0) }"
      end
    end
  end

  def carousel_partial
    context.items.each_with_index do |item, index|
      div class: "carousel-item #{'active' if index == (context.start || 0) } #{item[:class]}".strip,
        data: { "bs-interval": item[:interval] } do
        img class: "d-block w-100", path: item[:path]
        if item[:title] || item[:text]
          div class: "carousel-caption d-none d-md-block #{item[:title_class]}" do
            heading size: 5 do
              plain item[:title]
            end
            paragraph do
              plain item[:text]
            end
          end
        end
      end
    end
  end

  def controls_partial
    a class: "carousel-control-prev", data: { "bs-target": "##{carousel_id}", "bs-slide": :prev }, 'role': "button" do
      span class: "carousel-control-prev-icon", 'aria-hidden': "true"
      span class: "visually-hidden" do
        plain "Previous"
      end
    end
    a class: "carousel-control-next", data: { "bs-target": "##{carousel_id}", "bs-slide": :next }, 'role': "button" do
      span class: "carousel-control-next-icon", 'aria-hidden': "true"
      span class: "visually-hidden" do
        plain "Next"
      end
    end
  end

  def carousel_attributes
    options.merge(
      id: carousel_id,
      class: carousel_classes,
      data: { "bs-ride": 'carousel', "bs-interval": (context.interval || 5000) }
    )
  end

  def carousel_classes
    [].tap do |classes|
      classes << 'carousel slide'
      classes << 'carousel-fade' if context.fade
      classes << 'carousel-dark' if context.variant == :dark
      #custom classes
      classes << context.bs_class
    end.join(' ').strip
  end

  def carousel_id
    @carousel_id ||= "matestack-carousel-#{SecureRandom.hex}"
  end

end
