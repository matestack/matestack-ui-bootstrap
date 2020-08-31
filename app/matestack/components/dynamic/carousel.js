MatestackUiCore.Vue.component('matestack-ui-bootstrap-carousel', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      carouselInstance: undefined
    };
  },
  mounted() {
    var myCarousel = document.getElementById(this.componentConfig["carousel-id"])
    this.carouselInstance = new bootstrap.Carousel(myCarousel)
  }
});