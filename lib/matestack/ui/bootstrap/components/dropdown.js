import * as bootstrap from 'bootstrap'

import MatestackUiVueJs from 'matestack-ui-vuejs'

const dropdownComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,
  data() {
    return {
      dropdownInstance: undefined
    };
  },
  mounted() {
    // var mydropdown = document.getElementById(this.props["dropdown-id"])
    // this.dropdownInstance = new bootstrap.Dropdown(mydropdown)
  }
}

export default dropdownComponent
