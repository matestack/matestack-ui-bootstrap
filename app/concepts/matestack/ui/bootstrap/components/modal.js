import * as bootstrap from 'bootstrap'
import Vue from 'vue/dist/vue.esm'

import MatestackUiCore from 'matestack-ui-core'

Vue.component('matestack-ui-bootstrap-modal', {
  mixins: [MatestackUiCore.componentMixin],

  data() {
    return {
      modalInstance: undefined,
    };
  },

  methods: {
    toggle: function (){
      this.modalInstance.toggle()
    },
    show: function (){
      this.modalInstance.show()
    },
    hide: function (){
      this.modalInstance.hide()
    },
    handleUpdate: function (){
      this.modalInstance.handleUpdate()
    },
    dispose: function (){
      this.modalInstance.dispose()
    }
  },

  mounted: function() {
    const self = this
    var modal = self.$el
    self.modalInstance = new bootstrap.Modal(modal)
  },

  created: function() {
    const self = this
    var eventHub = MatestackUiCore.matestackEventHub;
    // toggle_on event registration
    if(self.componentConfig["toggle_on"] != undefined){
      var toggle_events = self.componentConfig["toggle_on"].split(",")
      toggle_events.forEach(toggle_event => eventHub.$on(toggle_event.trim(), self.toggle));
    }
    // show_on event registration
    if(self.componentConfig["show_on"] != undefined){
      var show_events = self.componentConfig["show_on"].split(",")
      show_events.forEach(show_event => eventHub.$on(show_event.trim(), self.show));
    }
    // hide_on event registration
    if(self.componentConfig["hide_on"] != undefined){
      var hide_events = self.componentConfig["hide_on"].split(",")
      hide_events.forEach(hide_event => eventHub.$on(hide_event.trim(), self.hide));
    }
    // handle_update_on event registration
    if(self.componentConfig["handle_update_on"] != undefined){
      var handle_update_events = self.componentConfig["handle_update_on"].split(",")
      handle_update_events.forEach(handle_update_event => eventHub.$on(handle_update_event.trim(), self.handle_update));
    }
    // dispose_on event registration
    if(self.componentConfig["dispose_on"] != undefined){
      var dispose_events = self.componentConfig["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => eventHub.$on(dispose_event.trim(), self.dispose));
    }
  },

  beforeDestroy: function() {
    const self = this
    var eventHub = MatestackUiCore.matestackEventHub;
    if(self.componentConfig["toggle_on"] != undefined){
      var toggle_events = self.componentConfig["toggle_on"].split(",")
      toggle_events.forEach(toggle_event => eventHub.$off(toggle_event.trim(), self.toggle));
    }
    if(self.componentConfig["show_on"] != undefined){
      var show_events = self.componentConfig["show_on"].split(",")
      show_events.forEach(show_event => eventHub.$off(show_event.trim(), self.show));
    }
    if(self.componentConfig["hide_on"] != undefined){
      var hide_events = self.componentConfig["hide_on"].split(",")
      hide_events.forEach(hide_event => eventHub.$off(hide_event.trim(), self.hide));
    }
    if(self.componentConfig["handle_update_on"] != undefined){
      var handle_update_events = self.componentConfig["handle_update_on"].split(",")
      handle_update_events.forEach(handle_update_event => eventHub.$off(handle_update_event.trim(), self.handle_update));
    }
    if(self.componentConfig["dispose_on"] != undefined){
      var dispose_events = self.componentConfig["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => eventHub.$off(dispose_event.trim(), self.dispose));
    }
  },
});
