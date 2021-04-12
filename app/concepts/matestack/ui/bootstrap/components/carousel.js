import * as bootstrap from 'bootstrap'
import Vue from 'vue/dist/vue.esm'

import MatestackUiCore from 'matestack-ui-core'

Vue.component('matestack-ui-bootstrap-carousel', {
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

  mounted: function() {
    const self = this;
    var myCarousel = self.$el;
    self.carouselInstance = new bootstrap.Carousel(myCarousel, {
      interval: (self.props['interval'] || 5000)
    })
  },

  created: function() {
    const self = this
    if(self.props["cycle_on"] != undefined){
      var cycle_events = self.props["cycle_on"].split(",")
      cycle_events.forEach(cycle_event => MatestackUiCore.matestackEventHub.$on(cycle_event.trim(), self.cycle));
    }
    if(self.props["pause_on"] != undefined){
      var pause_events = self.props["pause_on"].split(",")
      pause_events.forEach(pause_event => MatestackUiCore.matestackEventHub.$on(pause_event.trim(), self.pause));
    }
    if(self.props["prev_on"] != undefined){
      var prev_events = self.props["prev_on"].split(",")
      prev_events.forEach(prev_event => MatestackUiCore.matestackEventHub.$on(prev_event.trim(), self.prev));
    }
    if(self.props["next_on"] != undefined){
      var next_events = self.props["next_on"].split(",")
      next_events.forEach(next_event => MatestackUiCore.matestackEventHub.$on(next_event.trim(), self.next));
    }
  },

  beforeDestroy: function() {
    const self = this
    if(self.props["cycle_on"] != undefined){
      var cycle_events = self.props["cycle_on"].split(",")
      cycle_events.forEach(cycle_event => MatestackUiCore.matestackEventHub.$off(cycle_event.trim(), self.cycle));
    }

    if(self.props["pause_on"] != undefined){
      var pause_events = self.props["pause_on"].split(",")
      pause_events.forEach(pause_event => MatestackUiCore.matestackEventHub.$off(pause_event.trim(), self.pause));
    }

    if(self.props["prev_on"] != undefined){
      var prev_events = self.props["prev_on"].split(",")
      prev_events.forEach(prev_event => MatestackUiCore.matestackEventHub.$off(prev_event.trim(), self.prev));
    }
    if(self.props["next_on"] != undefined){
      var next_events = self.props["next_on"].split(",")
      next_events.forEach(next_event => MatestackUiCore.matestackEventHub.$off(next_event.trim(), self.next));
    }
  },
});
