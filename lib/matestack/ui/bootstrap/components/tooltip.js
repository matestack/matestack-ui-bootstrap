import * as bootstrap from 'bootstrap'
import MatestackUiVueJs from 'matestack-ui-vuejs'

const tooltipComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,
  data() {
    return {
      // tooltipInstance: undefined

    };
  },
  methods: {

  },
  mounted: function() {
    const self = this;
    var tooltip = self.getElement().firstChild
    self.tooltipInstance = new bootstrap.Tooltip(tooltip)
  }
  // created: function() {
  // },

  // beforeUnmount: function() {

  // },
}

export default tooltipComponent
