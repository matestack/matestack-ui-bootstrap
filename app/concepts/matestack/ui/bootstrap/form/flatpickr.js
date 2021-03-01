const bootstrap = require('bootstrap')
import flatpickr from "flatpickr";

MatestackUiCore.Vue.component('matestack-ui-bootstrap-form-flatpickr', {
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

// MatestackUiCore.Vue.component('matestack-ui-bootstrap-date', {
//   mixins: [MatestackUiCore.componentMixin],
//
//   data() {
//     return {};
//   },
//
//   methods: {
//
//   },
//
//   mounted: function() {
//     const self = this
//     let data = this.$parent.data;
//     flatpickr(this.$el.querySelector('.flatpickr'), {
//       defaultDate: this.componentConfig["init_value"],
//       enableTime: (this.componentConfig["enable_time"] == true)
//     });
//     for (let key in this.$refs) {
//       let initValue = this.$refs[key]["attributes"]["init-value"];
//
//       if (initValue) {
//         data[key.replace("input.", "")] = initValue["value"];
//       } else {
//         data[key.replace("input.", "")] = null;
//       }
//     }
//     this.$parent.data = data
//
//     //without the timeout it's somehow not working
//     setTimeout(function () {
//       self.$parent.data = data
//     }, 100);
//   }
// });
