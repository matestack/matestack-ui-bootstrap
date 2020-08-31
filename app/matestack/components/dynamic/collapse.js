MatestackUiCore.Vue.component('matestack-ui-bootstrap-collapse', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      collapseInstance: undefined
    };
  },
  mounted() {
    var myCollapse = document.getElementById(this.componentConfig["collapse-id"])
    this.collapseInstance = new bootstrap.Collapse(myCollapse)
  }
});