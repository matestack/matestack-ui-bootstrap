class Dummy::Components::ChartJs < Matestack::Ui::VueJsComponent
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

  def setup
    # injected into vue.js components
    @component_config[:type] = type
    @component_config[:datasets] = datasets
    @component_config[:labels] = labels
    @component_config[:display_legend] = !display_legend.nil? ? display_legend : false
    @component_config[:display_x_axes] = !display_x_axes.nil? ? display_x_axes : true
    @component_config[:display_y_axes] = !display_y_axes.nil? ? display_y_axes : true
    @component_config[:display_y_axes] = !display_y_axes.nil? ? display_y_axes : true
    @component_config[:cutout_percentage] = !cutout_percentage.nil? ? cutout_percentage : 70
  end

  def response
    div class: "chart-container #{context.class}", attributes: { style: "width: 100%; height: 100%;" } do
      plain "<canvas ref='chart'></canvas>".html_safe
    end
  end

end
