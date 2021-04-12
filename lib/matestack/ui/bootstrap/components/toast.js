import * as bootstrap from 'bootstrap'
import Vue from 'vue/dist/vue.esm'

import MatestackUiCore from 'matestack-ui-core'

Vue.component('matestack-ui-bootstrap-toast', {

  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      toastsInstance: undefined,
      eventData: {},
      showing: false,
    };
  },
  methods: {
    show: function(event){
      const self = this;
      if(this.props["autohide"]){
        setTimeout(function () {
          self.showing = false;
        }, 5000);
      }
      if(this.props["delay"]){
        setTimeout(function () {
          self.showing = true;
        }, parseInt(self.props["delay"]));
      } else {
        self.showing = true
      }
      this.eventData = event
    },
    hide: function(event){
      const self = this;
      this.showing = false
      setTimeout(function () {
        self.eventData = false;
      }, 500);
    },
    dispose: function(){
      const self = this;
      self.toastsInstance.dispose()
      self.toastsInstance = new bootstrap.Toast(self.$el)
    }
  },
  mounted: function() {
    const self = this;
    var myToasts = self.$el
    self.toastsInstance = new bootstrap.Toast(myToasts)
  },
  created: function() {
    const self = this

    if(this.props["show_on"] != undefined){
      var show_events = this.props["show_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.show));
    }

    if(this.props["hide_on"] != undefined){
      var show_events = this.props["hide_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.hide));
    }

    if(this.props["dispose_on"] != undefined){
      var show_events = this.props["dispose_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.dispose));
    }
  },

  beforeDestroy: function() {
    const self = this
    MatestackUiCore.matestackEventHub.$off(this.props["show_on"], self.show);
    MatestackUiCore.matestackEventHub.$off(this.props["hide_on"], self.hide);
    MatestackUiCore.matestackEventHub.$off(this.props["dispose_on"], self.hide);
    if(this.props["show_on"] != undefined){
      var shown_events = this.props["show_on"].split(",")
      shown_events.forEach(show_event => MatestackUiCore.matestackEventHub.$off(show_event.trim(), self.show));
    }
    if(this.props["hide_on"] != undefined){
      var hiden_events = this.props["hide_on"].split(",")
      hiden_events.forEach(hide_event => MatestackUiCore.matestackEventHub.$off(hide_event.trim(), self.hide));
    }
    if(this.props["dispose_on"] != undefined){
      var hiden_events = this.props["dispose_on"].split(",")
      hiden_events.forEach(hide_event => MatestackUiCore.matestackEventHub.$off(hide_event.trim(), self.dispose));
    }
  },
});
