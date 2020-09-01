MatestackUiCore.Vue.component('matestack-ui-bootstrap-dropdown', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      dropdownInstance: undefined
    };
  },
  mounted() {
    var mydropdown = document.getElementById(this.componentConfig["dropdown-id"])
    // this.dropdownInstance = new bootstrap.dropdown(mydropdown)
  }
});