import * as bootstrap from 'bootstrap'

import MatestackUiVueJs from 'matestack-ui-vuejs'

const alertComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,

  data() {
    return {
      alertInstance: undefined,
    };
  },

  methods: {
    close: function (){
      this.alertInstance.close()
    },
    dispose: function (){
      this.alertInstance.dispose()
      // this.alertInstance = new bootstrap.Alert(self.getElement())
    }
  },

  mounted: function() {
    const self = this
    var alert = self.getElement()
    self.alertInstance = new bootstrap.Alert(alert)
  },

  created: function() {
    const self = this
    // close_on event registration
    if(self.props["close_on"] != undefined){
      var close_events = self.props["close_on"].split(",")
      close_events.forEach(close_event => MatestackUiVueJs.eventHub.$on(close_event.trim(), self.close));
    }
    // dispose_on event registration
    if(self.props["dispose_on"] != undefined){
      var dispose_events = self.props["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => MatestackUiVueJs.eventHub.$on(dispose_event.trim(), self.dispose));
    }
  },

  beforeUnmount: function() {
    const self = this
    if(self.props["close_on"] != undefined){
      var closen_events = self.props["close_on"].split(",")
      closen_events.forEach(close_event => MatestackUiVueJs.eventHub.$off(close_event.trim(), self.close));
    }
    if(self.props["dispose_on"] != undefined){
      var dispose_events = self.props["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => MatestackUiVueJs.eventHub.$off(dispose_event.trim(), self.dispose));
    }
  },
}

export default alertComponent
