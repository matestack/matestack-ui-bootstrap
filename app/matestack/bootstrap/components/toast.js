MatestackUiCore.Vue.component('matestack-ui-bootstrap-toast', {

  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      toastsInstance: undefined
    };
  },
  methods: {
    show: function(){
      const self = this;
      self.toastsInstance.show()
    },
    hide: function(){
      const self = this;
      self.toastsInstance.hide()
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

    if(this.componentConfig["show_on"] != undefined){
      var show_events = this.componentConfig["show_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.show));
    }

    if(this.componentConfig["hide_on"] != undefined){
      var show_events = this.componentConfig["hide_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.hide));
    }

    if(this.componentConfig["dispose_on"] != undefined){
      var show_events = this.componentConfig["dispose_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.dispose));
    }
  },

  beforeDestroy: function() {
    const self = this
    MatestackUiCore.matestackEventHub.$off(this.componentConfig["show_on"], self.show);
    MatestackUiCore.matestackEventHub.$off(this.componentConfig["hide_on"], self.hide);
    MatestackUiCore.matestackEventHub.$off(this.componentConfig["dispose_on"], self.hide);
    if(this.componentConfig["show_on"] != undefined){
      var shown_events = this.componentConfig["show_on"].split(",")
      shown_events.forEach(show_event => MatestackUiCore.matestackEventHub.$off(show_event.trim(), self.show));
    }
    if(this.componentConfig["hide_on"] != undefined){
      var hiden_events = this.componentConfig["hide_on"].split(",")
      hiden_events.forEach(hide_event => MatestackUiCore.matestackEventHub.$off(hide_event.trim(), self.hide));
    }
    if(this.componentConfig["dispose_on"] != undefined){
      var hiden_events = this.componentConfig["dispose_on"].split(",")
      hiden_events.forEach(hide_event => MatestackUiCore.matestackEventHub.$off(hide_event.trim(), self.dispose));
    }
  },
});