class Matestack::Ui::Bootstrap::Components::Chart < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-chart"

  requires :type
  requires :datasets
  optional :labels
  optional :height
  optional :width
  optional :display_legend
  optional :display_x_axes
  optional :display_y_axes
  optional :cutout_percentage
  optional class: { as: :bs_class }

  def setup
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
    div class: "chart-container #{bs_class}", attributes: { style: "width: 100%; height: 100%;" } do
      plain "<canvas ref='chart'></canvas>".html_safe
    end
  end

end

# chart class: "w-50", type: :bar, datasets: [
#   {
#     label: "€",
#     data: [total, last_7_days, last_30_days],
#     backgroundColor: :primary
#   },
# ], labels: ["total", "last 7 days", "last 30 days"]

# chart type: :doughnut, datasets: [
#   {
#     label: "€",
#     data: [total, last_7_days, last_30_days],
#     backgroundColor: [:orange, :secondary, :primary]
#   },
# ], labels: ["total", "last 7 days", "last 30 days"]

# chart type: :line, datasets: [
#   {
#     label: "€",
#     data: [total, last_7_days, last_30_days],
#     borderColor: :primary,
#     pointRadius: 0
#   },
#   {
#     label: "€",
#     data: [last_7_days, total, last_30_days],
#     borderColor: :danger,
#     fill: false
#   },
# ], labels: ["total", "last 7 days", "last 30 days"], display_x_axes: false, display_y_axes: false

# chart type: :pie, datasets: [
#   {
#     label: "€",
#     data: [total, last_7_days, last_30_days],
#     backgroundColor: [:orange, :secondary, :primary]
#   },
# ], labels: ["total", "last 7 days", "last 30 days"]
