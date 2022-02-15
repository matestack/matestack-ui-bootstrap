import * as bootstrap from 'bootstrap'

import MatestackUiVueJs from 'matestack-ui-vuejs'

const carouselComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,
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

  mounted: function() {
    const self = this;
    var myCarousel = self.getElement();
    self.carouselInstance = new bootstrap.Carousel(myCarousel, {
      interval: (self.props['interval'] || 5000)
    })
  },

  created: function() {
    const self = this
    if(self.props["cycle_on"] != undefined){
      var cycle_events = self.props["cycle_on"].split(",")
      cycle_events.forEach(cycle_event => MatestackUiVueJs.eventHub.$on(cycle_event.trim(), self.cycle));
    }
    if(self.props["pause_on"] != undefined){
      var pause_events = self.props["pause_on"].split(",")
      pause_events.forEach(pause_event => MatestackUiVueJs.eventHub.$on(pause_event.trim(), self.pause));
    }
    if(self.props["prev_on"] != undefined){
      var prev_events = self.props["prev_on"].split(",")
      prev_events.forEach(prev_event => MatestackUiVueJs.eventHub.$on(prev_event.trim(), self.prev));
    }
    if(self.props["next_on"] != undefined){
      var next_events = self.props["next_on"].split(",")
      next_events.forEach(next_event => MatestackUiVueJs.eventHub.$on(next_event.trim(), self.next));
    }
  },

  beforeUnmount: function() {
    const self = this
    if(self.props["cycle_on"] != undefined){
      var cycle_events = self.props["cycle_on"].split(",")
      cycle_events.forEach(cycle_event => MatestackUiVueJs.eventHub.$off(cycle_event.trim(), self.cycle));
    }

    if(self.props["pause_on"] != undefined){
      var pause_events = self.props["pause_on"].split(",")
      pause_events.forEach(pause_event => MatestackUiVueJs.eventHub.$off(pause_event.trim(), self.pause));
    }

    if(self.props["prev_on"] != undefined){
      var prev_events = self.props["prev_on"].split(",")
      prev_events.forEach(prev_event => MatestackUiVueJs.eventHub.$off(prev_event.trim(), self.prev));
    }
    if(self.props["next_on"] != undefined){
      var next_events = self.props["next_on"].split(",")
      next_events.forEach(next_event => MatestackUiVueJs.eventHub.$off(next_event.trim(), self.next));
    }
  },
}

export default carouselComponent
