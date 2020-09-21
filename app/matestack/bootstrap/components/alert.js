MatestackUiCore.Vue.component('matestack-ui-bootstrap-alert', {
  mixins: [MatestackUiCore.componentMixin],

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
    }
  },

  mounted: function() {
    var alert = self.$el
    this.alertInstance = new bootstrap.Alert(alert)
  },

  created: function() {
    const self = this
    // close_on event registration
    if(self.componentConfig["close_on"] != undefined){
      var close_events = self.componentConfig["close_on"].split(",")
      close_events.forEach(close_event => MatestackUiCore.matestackEventHub.$on(close_event.trim(), self.close));
    }
    // dispose_on event registration
    if(self.componentConfig["dispose_on"] != undefined){
      var dispose_events = self.componentConfig["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => MatestackUiCore.matestackEventHub.$on(dispose_event.trim(), self.dispose));
    }
  },

  beforeDestroy: function() {
    const self = this
    if(self.componentConfig["close_on"] != undefined){
      var closen_events = self.componentConfig["close_on"].split(",")
      closen_events.forEach(close_event => MatestackUiCore.matestackEventHub.$off(close_event.trim(), self.close));
    }
    if(self.componentConfig["dispose_on"] != undefined){
      var dispose_events = self.componentConfig["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => MatestackUiCore.matestackEventHub.$off(dispose_event.trim(), self.dispose));
    }
  },
});