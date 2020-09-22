MatestackUiCore.Vue.component('matestack-ui-bootstrap-carousel', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      carouselInstance: undefined
    };
  },
  methods: {
    cycle: function(){
      const self = this;
      self.carouselInstance.cycle()
    },
    pause: function(){
      const self = this;
      self.carouselInstance.pause()
    },
    prev: function(){
      const self = this;
      self.carouselInstance.prev()
    },
    next: function(){
      const self = this;
      self.carouselInstance.next()
    }
  },
  mounted() {
    var myCarousel = document.getElementById(this.componentConfig["carousel-id"])
    this.carouselInstance = new bootstrap.Carousel(myCarousel)
  },
  created: function() {
    const self = this
    if(this.componentConfig["cycle_on"] != undefined){
      var cycle_events = this.componentConfig["cycle_on"].split(",")
      cycle_events.forEach(cycle_event => MatestackUiCore.matestackEventHub.$on(cycle_event.trim(), self.cycle));
    }
    if(this.componentConfig["pause_on"] != undefined){
      var pause_events = this.componentConfig["pause_on"].split(",")
      pause_events.forEach(pause_event => MatestackUiCore.matestackEventHub.$on(pause_event.trim(), self.pause));
    }
    if(this.componentConfig["prev_on"] != undefined){
      var prev_events = this.componentConfig["prev_on"].split(",")
      prev_events.forEach(prev_event => MatestackUiCore.matestackEventHub.$on(prev_event.trim(), self.prev));
    }
    if(this.componentConfig["next_on"] != undefined){
      var next_events = this.componentConfig["next_on"].split(",")
      next_events.forEach(next_event => MatestackUiCore.matestackEventHub.$on(next_event.trim(), self.next));
    }
  },

  beforeDestroy: function() {
    const self = this
    MatestackUiCore.matestackEventHub.$off(this.componentConfig["cycle_on"], self.cycle);
    MatestackUiCore.matestackEventHub.$off(this.componentConfig["pause_on"], self.pause);
    MatestackUiCore.matestackEventHub.$off(this.componentConfig["prev_on"], self.prev);
    MatestackUiCore.matestackEventHub.$off(this.componentConfig["next_on"], self.next);
    if(this.componentConfig["cycle_on"] != undefined){
      var cycle_events = this.componentConfig["cycle_on"].split(",")
      cycle_events.forEach(cycle_event => MatestackUiCore.matestackEventHub.$off(cycle_event.trim(), self.cycle));
    }

    if(this.componentConfig["pause_on"] != undefined){
      var pause_events = this.componentConfig["pause_on"].split(",")
      pause_events.forEach(pause_event => MatestackUiCore.matestackEventHub.$off(pause_event.trim(), self.pause));
    }

    if(this.componentConfig["prev_on"] != undefined){
      var prev_events = this.componentConfig["prev_on"].split(",")
      prev_events.forEach(prev_event => MatestackUiCore.matestackEventHub.$off(prev_event.trim(), self.prev));
    }
    if(this.componentConfig["next_on"] != undefined){
      var next_events = this.componentConfig["next_on"].split(",")
      next_events.forEach(next_event => MatestackUiCore.matestackEventHub.$off(next_event.trim(), self.next));
    }
  },
});