import * as bootstrap from 'bootstrap'

MatestackUiCore.Vue.component('matestack-ui-bootstrap-tooltip', {

  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      // tooltipInstance: undefined

    };
  },
  methods: {

  },
  mounted: function() {
    const self = this;
    var tooltip = self.$el
    self.tooltipInstance = new bootstrap.Tooltip(tooltip)
  }
  // created: function() {
  // },

  // beforeDestroy: function() {

  // },
});
