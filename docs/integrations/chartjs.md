# Chart.js

Chart.js integration, Bootstrap theming aware. In order to limit the scope of the `matestack-ui-bootstrap` gem, Chart.js components are not part of this gem. The below shown example should enable you to easily integrate Chart.js \(or any other chart library\) according to your needs!

## Ruby component

`app/matestack/components/chart_js.rb`

```ruby
class Components::ChartJs < Matestack::Ui::VueJsComponent
  vue_js_component_name "chart-js-component"

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
    div class: "chart-container #{bs_class}", attributes: { style: "width: 100%; height: 100%;" } do
      plain "<canvas ref='chart'></canvas>".html_safe
    end
  end

end
```

`app/matestack/components/registry.rb`

## Registry

```ruby
module Components::Registry

  Matestack::Ui::Core::Component::Registry.register_components(
    #...
    chart_js: Components::ChartJs
    #...
  )

end
```

`app/matestack/components/chart_js.js`

## Vue.js component

**Do not forget to require chart.js in your package.json** **Do not forget to import the following file into you application pack**

```javascript
import Chart from 'chart.js';

MatestackUiCore.Vue.component('chart-js-component', {
  mixins: [MatestackUiCore.componentMixin],

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
      this.componentConfig["datasets"].forEach(function(item){
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
            labels: this.componentConfig["labels"],
            datasets: this.componentConfig["datasets"]
        },
        options: {
            legend: {
              display: this.componentConfig["display_legend"],
            },
            scales: {
                yAxes: [{
                    display: this.componentConfig["display_y_axes"],
                    gridLines: {
                      display: false,
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    display: this.componentConfig["display_x_axes"],
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
      this.componentConfig["datasets"].forEach(function(item){
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
            labels: this.componentConfig["labels"],
            datasets: this.componentConfig["datasets"]
        },
        options: {
            legend: {
              display: this.componentConfig["display_legend"],
            },
            scales: {
                yAxes: [{
                    display: this.componentConfig["display_y_axes"],
                    gridLines: {
                      display: false,
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    display: this.componentConfig["display_x_axes"],
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
      this.componentConfig["datasets"].forEach(function(item){
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
            labels: this.componentConfig["labels"],
            datasets: this.componentConfig["datasets"]
        },
        options: {
            legend: {
              display: this.componentConfig["display_legend"],
            },
            cutoutPercentage: this.componentConfig["cutout_percentage"]
        }
      });
    },
    drawPieChart: function(chartElement){
      const self = this;
      this.componentConfig["datasets"].forEach(function(item){
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
            labels: this.componentConfig["labels"],
            datasets: this.componentConfig["datasets"]
        },
        options: {
            legend: {
              display: this.componentConfig["display_legend"],
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

    if(this.componentConfig["type"] == "bar"){
      this.drawBarChart(chartElement);
    }
    if(this.componentConfig["type"] == "line"){
      this.drawLineChart(chartElement);
    }
    if(this.componentConfig["type"] == "doughnut"){
      this.drawDoughnutChart(chartElement);
    }
    if(this.componentConfig["type"] == "pie"){
      this.drawPieChart(chartElement);
    }

  }
});
```

## Usage

### Example 1: Bar chart

```ruby
chart_js class: "w-50", type: :bar, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: :primary
  },
], labels: ["x", "y", "z"]
```

### Example 2: Doughnut chart

```ruby
chart_js type: :doughnut, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: [:orange, :secondary, :primary]
  },
], labels: ["x", "y", "z"]
```

### Example 3: Line chart

```ruby
chart_js type: :line, datasets: [
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
], labels: ["x", "y", "z"], display_x_axes: false, display_y_axes: false
```

### Example 4: Pie chart

```ruby
chart_js type: :pie, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: [:orange, :secondary, :primary]
  },
], labels: ["x", "y", "z"]
```

