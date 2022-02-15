import * as bootstrap from 'bootstrap'

import MatestackUiVueJs from 'matestack-ui-vuejs'

const popoverComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,
  data() {
    return {
      popoverInstance: undefined

    };
  },
  methods: {

  },
  mounted: function() {
    const self = this;
    const popoverElement = self.getElement()
    self.popoverInstance = new bootstrap.Popover(popoverElement, {})
  },
  created: function() {
  },

  beforeUnmount: function() {

  },
}

export default popoverComponent
