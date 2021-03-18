class Dummy::Components::ChartJs < ApplicationVueJsComponent
  vue_name "chart-js-component"

  required :type
  required :datasets
  optional :labels
  optional :height
  optional :width
  optional :display_legend
  optional :display_x_axes
  optional :display_y_axes
  optional :cutout_percentage
  optional :class

  def config
    # injected into vue.js components
    {}.tap do |props|
      props[:type] = context.type
      props[:datasets] = context.datasets
      props[:labels] = context.labels
      props[:display_legend] = !context.display_legend.nil? ? context.display_legend : false
      props[:display_x_axes] = !context.display_x_axes.nil? ? context.display_x_axes : true
      props[:display_y_axes] = !context.display_y_axes.nil? ? context.display_y_axes : true
      props[:display_y_axes] = !context.display_y_axes.nil? ? context.display_y_axes : true
      props[:cutout_percentage] = !context.cutout_percentage.nil? ? context.cutout_percentage : 70
    end
  end

  def response
    div class: "chart-container #{context.class}", attributes: { style: "width: 100%; height: 100%;" } do
      plain "<canvas ref='chart'></canvas>".html_safe
    end
  end

end
