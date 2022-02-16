# Chart.js

Chart.js integration, Bootstrap theming aware. In order to limit the scope of the `matestack-ui-bootstrap` gem, Chart.js components are not part of this gem. The below shown example should enable you to easily integrate Chart.js by copy&paste \(or any other chart library\) and optionally adjust according to your needs!

**Example and docs below are meant to support Chart.js v2, not Chart.js v3**

## Ruby component

`app/matestack/components/chart_js.rb`

```ruby
class Components::ChartJs < Matestack::Ui::VueJsComponent
  vue_name "chart-js-component"

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

  # injected into vue.js components
  def vue_props
    {}.tap do |props|
      props[:type] = context.type
      props[:datasets] = context.datasets
      props[:labels] = context.labels
      props[:display_legend] = !display_legend.nil? ? context.display_legend : false
      props[:display_x_axes] = !display_x_axes.nil? ? context.display_x_axes : true
      props[:display_y_axes] = !display_y_axes.nil? ? context.display_y_axes : true
      props[:display_y_axes] = !display_y_axes.nil? ? context.display_y_axes : true
      props[:cutout_percentage] = !context.cutout_percentage.nil? ? context.cutout_percentage : 70
    end
  end

  def response
    div class: "chart-container #{context.bs_class}",  style: "width: 100%; height: 100%;" do
      plain "<canvas matestack-ui-vuejs-ref=#{matestack_ui_vuejs_ref('chart')}></canvas>".html_safe
    end
  end

end
```

## Vue.js component

If not already installed, do:

```ruby
yarn add chart.js@2.9.4
```

**Do not forget to import the following file into you application pack**

`app/matestack/components/chart_js.js`

```javascript
import Chart from 'chart.js';
import MatestackUiVueJs from 'matestack-ui-vuejs'

const chartJsComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,

  data() {
    return {
      chartJsInstance: undefined,
      defaultColor: undefined,
      fontColor: undefined,
      fontFamily: undefined
    };
  },

  methods: {
    getThemeColor: function(key){
      const style = getComputedStyle(document.body);
      return style.getPropertyValue('--bs-'+key);
    },
    getThemeColorArray: function(keysArray){
      let result = []
      const style = getComputedStyle(document.body);
      keysArray.forEach(function(key){
        result.push(style.getPropertyValue('--bs-'+key))
      })
      return result;
    },
    drawBarChart: function(chartElement){
      const self = this;
      this.props["datasets"].forEach(function(item){
        if (item["backgroundColor"] === undefined){
          item["backgroundColor"] = self.getThemeColor("primary")
        }else{
          if(Array.isArray(item["backgroundColor"])){
            item["backgroundColor"] = self.getThemeColorArray(item["backgroundColor"])
          }else{
            item["backgroundColor"] = self.getThemeColor(item["backgroundColor"])
          }
        }
        item["hoverBackgroundColor"] = "rgba(0, 0, 0, 0.1)"
        if (item["barThickness"] === undefined){
          item["barThickness"] = 10;
        }
      })
      this.chartJsInstance = new Chart(chartElement, {
        type: 'bar',
        data: {
            labels: this.props["labels"],
            datasets: this.props["datasets"]
        },
        options: {
            legend: {
              display: this.props["display_legend"],
            },
            scales: {
                yAxes: [{
                    display: this.props["display_y_axes"],
                    gridLines: {
                      display: false,
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    display: this.props["display_x_axes"],
                    gridLines: {
                      display: false,
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
      });
    },
    drawLineChart: function(chartElement){
      const self = this;
      this.props["datasets"].forEach(function(item){
        if (item["borderColor"] === undefined){
          item["borderColor"] = self.getThemeColor("primary")
        }else{
          item["borderColor"] = self.getThemeColor(item["borderColor"])
        }
        item["hoverBackgroundColor"] = "rgba(0, 0, 0, 0.1)"
        if (item["fill"] === undefined){
          item["fill"] = false;
        }
      })
      this.chartJsInstance = new Chart(chartElement, {
        type: 'line',
        data: {
            labels: this.props["labels"],
            datasets: this.props["datasets"]
        },
        options: {
            legend: {
              display: this.props["display_legend"],
            },
            scales: {
                yAxes: [{
                    display: this.props["display_y_axes"],
                    gridLines: {
                      display: false,
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    display: this.props["display_x_axes"],
                    gridLines: {
                      display: false,
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
      });
    },
    drawDoughnutChart: function(chartElement){
      const self = this;
      this.props["datasets"].forEach(function(item){
        if (item["backgroundColor"] === undefined){
          item["backgroundColor"] = self.getThemeColor("primary")
        }else{
          if(Array.isArray(item["backgroundColor"])){
            item["backgroundColor"] = self.getThemeColorArray(item["backgroundColor"])
          }else{
            item["backgroundColor"] = self.getThemeColor(item["backgroundColor"])
          }
        }
        item["hoverBackgroundColor"] = "rgba(0, 0, 0, 0.1)"
        if (item["borderColor"] === undefined){
          item["borderColor"] = self.getThemeColor("white")
        }else{
          item["borderColor"] = self.getThemeColor(item["borderColor"])
        }
        if (item["hoverBorderColor"] === undefined){
          item["hoverBorderColor"] = self.getThemeColor("white")
        }else{
          item["hoverBorderColor"] = self.getThemeColor(item["hoverBorderColor"])
        }
        if (item["borderWidth"] === undefined){
          item["borderWidth"] = 10
        }
        if (item["weight"] === undefined){
          item["weight"] = 1
        }
      })
      this.chartJsInstance = new Chart(chartElement, {
        type: 'doughnut',
        data: {
            labels: this.props["labels"],
            datasets: this.props["datasets"]
        },
        options: {
            legend: {
              display: this.props["display_legend"],
            },
            cutoutPercentage: this.props["cutout_percentage"]
        }
      });
    },
    drawPieChart: function(chartElement){
      const self = this;
      this.props["datasets"].forEach(function(item){
        if (item["backgroundColor"] === undefined){
          item["backgroundColor"] = self.getThemeColor("primary")
        }else{
          if(Array.isArray(item["backgroundColor"])){
            item["backgroundColor"] = self.getThemeColorArray(item["backgroundColor"])
          }else{
            item["backgroundColor"] = self.getThemeColor(item["backgroundColor"])
          }
        }
        item["hoverBackgroundColor"] = "rgba(0, 0, 0, 0.1)"
      })
      this.chartJsInstance = new Chart(chartElement, {
        type: 'pie',
        data: {
            labels: this.props["labels"],
            datasets: this.props["datasets"]
        },
        options: {
            legend: {
              display: this.props["display_legend"],
            }
        }
      });
    },
  },

  mounted: function() {
    const style = getComputedStyle(document.body);

    this.defaultColor = style.getPropertyValue('--bs-primary');
    this.fontColor = style.getPropertyValue('--bs-secondary');
    this.fontFamily = style.getPropertyValue('--bs-font-sans-serif');

    Chart.defaults.global.defaultFontColor = this.fontColor
    Chart.defaults.global.defaultFontFamily = this.fontFamily
    Chart.defaults.global.defaultColor = this.fontFamily

    const chartElement = this.$refs.chart

    if(this.props["type"] == "bar"){
      this.drawBarChart(chartElement);
    }
    if(this.props["type"] == "line"){
      this.drawLineChart(chartElement);
    }
    if(this.props["type"] == "doughnut"){
      this.drawDoughnutChart(chartElement);
    }
    if(this.props["type"] == "pie"){
      this.drawPieChart(chartElement);
    }

  }
}

export default chartJsComponent
```

and then in your application.js file:

```javascript
import chartJsComponent from '../../matestack/components/chart_js.js'// import component definition from source

const appInstance = createApp({})

appInstance.component('chart-js-component', chartJsComponent) // register at appInstance

MatestackUiBootstrap.registerComponents(appInstance)

document.addEventListener('DOMContentLoaded', () => {
  MatestackUiVueJs.mount(appInstance)
})
```

## Usage

### Example 1: Bar chart

```ruby
Components::ChartJs.call(class: "w-50", type: :bar, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: :primary
  },
], labels: ["x", "y", "z"])
```

### Example 2: Doughnut chart

```ruby
Components::ChartJs.call(type: :doughnut, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: [:orange, :secondary, :primary]
  },
], labels: ["x", "y", "z"])
```

### Example 3: Line chart

```ruby
Components::ChartJs.call(type: :line, datasets: [
  {
    label: "€",
    data: [x, y, z],
    borderColor: :primary,
    pointRadius: 0
  },
  {
    label: "€",
    data: [last_7_days, total, last_30_days],
    borderColor: :danger,
    fill: false
  },
], labels: ["x", "y", "z"], display_x_axes: false, display_y_axes: false)
```

### Example 4: Pie chart

```ruby
Components::ChartJs.call(type: :pie, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: [:orange, :secondary, :primary]
  },
], labels: ["x", "y", "z"])
```
