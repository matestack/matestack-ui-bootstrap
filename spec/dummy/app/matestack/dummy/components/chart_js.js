import Chart from 'chart.js';
import Vue from 'vue/dist/vue.esm'


import MatestackUiCore from 'matestack-ui-core'

Vue.component('chart-js-component', {
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

  },

  created: function() {

  },

  beforeDestroy: function() {

  },
});
