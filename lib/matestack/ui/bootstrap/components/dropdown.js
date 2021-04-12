import * as bootstrap from 'bootstrap'
import Vue from 'vue/dist/vue.esm'

import MatestackUiCore from 'matestack-ui-core'

Vue.component('matestack-ui-bootstrap-dropdown', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      dropdownInstance: undefined
    };
  },
  mounted() {
    // var mydropdown = document.getElementById(this.props["dropdown-id"])
    // this.dropdownInstance = new bootstrap.Dropdown(mydropdown)
  }
});
