MatestackUiCore.Vue.component('matestack-ui-bootstrap-collapse', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      collapseInstance: undefined
    };
  },

  methods: {
    toggle: function (){
      this.collapseInstance.toggle();
    },
    show: function(){
      this.collapseInstance.show();
    },
    hide: function(){
      this.collapseInstance.hide();
    },
    dispose: function(){
      this.collapseInstance.dispose();
    }
  },

  mounted: function() {
    const self = this;
    var myCollapse = self.$el;
    this.collapseInstance = new bootstrap.Collapse(myCollapse)
  },

  created: function() {
    // toggle_on event registration
    if(self.componentConfig["toggle_on"] != undefined){
      var toggle_events = self.componentConfig["toggle_on"].split(",")
      toggle_events.forEach(toggle_event => MatestackUiCore.matestackEventHub.$on(toggle_event.trim(), self.toggle));
    } 
    // show_on event registration
    if(self.componentConfig["show_on"] != undefined){
      var show_events = self.componentConfig["show_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.show));
    } 
    // hide_on event registration
    if(self.componentConfig["hide_on"] != undefined){
      var hide_events = self.componentConfig["hide_on"].split(",")
      hide_events.forEach(hide_event => MatestackUiCore.matestackEventHub.$on(hide_event.trim(), self.hide));
    }
    // dispose_on event registration
    if(self.componentConfig["dispose_on"] != undefined){
      var dispose_events = self.componentConfig["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => MatestackUiCore.matestackEventHub.$on(dispose_event.trim(), self.dispose));
    }
  },

  beforeDestroy: function(){
    const self = this
    if(self.componentConfig["show_on"] != undefined){
      var show_events = self.componentConfig["close_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$off(show_event.trim(), self.show));
    }
    if(self.componentConfig["show_on"] != undefined){
      var show_events = self.componentConfig["show_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$off(show_event.trim(), self.show));
    }
    if(self.componentConfig["hide_on"] != undefined){
      var hide_events = self.componentConfig["hide_on"].split(",")
      hide_events.forEach(hide_event => MatestackUiCore.matestackEventHub.$off(hide_event.trim(), self.hide));
    }
    if(self.componentConfig["dispose_on"] != undefined){
      var dispose_events = self.componentConfig["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => MatestackUiCore.matestackEventHub.$off(dispose_event.trim(), self.dispose));
    }
  }
});