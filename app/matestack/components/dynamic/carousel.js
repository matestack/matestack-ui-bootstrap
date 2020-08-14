MatestackUiCore.Vue.component('matestack-ui-bootstrap-carousel', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      alertInstance: undefined
    };
  },
  mounted() {
    var myCarousel = document.getElementById(this.componentConfig["carousel-id"])
  }
});