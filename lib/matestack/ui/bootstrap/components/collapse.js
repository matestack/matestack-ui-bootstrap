import * as bootstrap from 'bootstrap'

import MatestackUiVueJs from 'matestack-ui-vuejs'

const collapseComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,
  data() {
    return {
      collapseInstance: undefined
    };
  },

  methods: {
    toggle: function (){
      const self = this;
      self.collapseInstance.toggle();
    },
    show: function(){
      const self = this;
      self.collapseInstance.show();
    },
    hide: function(){
      const self = this;
      self.collapseInstance.hide();
    },
    dispose: function(){
      const self = this;
      self.collapseInstance.hide();
      self.collapseInstance.dispose();
      // ToDo: Error occurs after dispose when click on the button again
    }
  },

  mounted: function() {
    const self = this;
    const collapseElement = self.getElement()
    self.collapseInstance = new bootstrap.Collapse(collapseElement, {
      toggle: false
    })
  },

  created: function() {
    const self = this

    // toggle_on event registration
    if(self.props["toggle_on"] != undefined){
      var toggle_events = self.props["toggle_on"].split(",")
      toggle_events.forEach(toggle_event => MatestackUiVueJs.eventHub.$on(toggle_event.trim(), self.toggle));
    }
    // show_on event registration
    if(self.props["show_on"] != undefined){
      var show_events = self.props["show_on"].split(",")
      show_events.forEach(show_event => MatestackUiVueJs.eventHub.$on(show_event.trim(), self.show));
    }
    // hide_on event registration
    if(self.props["hide_on"] != undefined){
      var hide_events = self.props["hide_on"].split(",")
      hide_events.forEach(hide_event => MatestackUiVueJs.eventHub.$on(hide_event.trim(), self.hide));
    }
    // dispose_on event registration
    if(self.props["dispose_on"] != undefined){
      var dispose_events = self.props["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => MatestackUiVueJs.eventHub.$on(dispose_event.trim(), self.dispose));
    }
  },

  beforeUnmount: function(){
    const self = this
    if(self.props["toggle_on"] != undefined){
      var show_events = self.props["toggle_on"].split(",")
      show_events.forEach(show_event => MatestackUiVueJs.eventHub.$off(show_event.trim(), self.show));
    }
    if(self.props["show_on"] != undefined){
      var show_events = self.props["show_on"].split(",")
      show_events.forEach(show_event => MatestackUiVueJs.eventHub.$off(show_event.trim(), self.show));
    }
    if(self.props["hide_on"] != undefined){
      var hide_events = self.props["hide_on"].split(",")
      hide_events.forEach(hide_event => MatestackUiVueJs.eventHub.$off(hide_event.trim(), self.hide));
    }
    if(self.props["dispose_on"] != undefined){
      var dispose_events = self.props["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => MatestackUiVueJs.eventHub.$off(dispose_event.trim(), self.dispose));
    }
  }
}

export default collapseComponent
