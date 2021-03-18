import flatpickr from "flatpickr";
import Vue from 'vue/dist/vue.esm'

import MatestackUiCore from 'matestack-ui-core'

Vue.component('form-flatpickr-component', {
  mixins: [MatestackUiCore.componentMixin, MatestackUiCore.formInputMixin],
  data() {
    return {};
  },
  mounted: function(){
    flatpickr(this.$el.querySelector('.flatpickr'), {
      defaultDate: this.componentConfig["init_value"],
      enableTime: (this.componentConfig["enable_time"] == true)
    });
  }
});
