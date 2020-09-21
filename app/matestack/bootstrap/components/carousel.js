MatestackUiCore.Vue.component('matestack-ui-bootstrap-carousel', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      carouselInstance: undefined
    };
  },
  mounted() {
    var myCarousel = document.getElementById(this.componentConfig["carousel-id"])
    // this.carouselInstance = new bootstrap.Carousel(myCarousel)
    // TODO we should implement the methods with event based options like toast, alert etc.
  }
});