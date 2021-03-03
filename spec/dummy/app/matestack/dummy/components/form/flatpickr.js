import flatpickr from "flatpickr";

MatestackUiCore.Vue.component('form-flatpickr-component', {
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
