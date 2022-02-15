import * as bootstrap from 'bootstrap'

import MatestackUiVueJs from 'matestack-ui-vuejs'

const toastComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,
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
      self.toastsInstance = new bootstrap.Toast(self.getElement())
    }
  },
  mounted: function() {
    const self = this;
    var myToasts = self.getElement()
    self.toastsInstance = new bootstrap.Toast(myToasts)
  },
  created: function() {
    const self = this

    if(this.props["show_on"] != undefined){
      var show_events = this.props["show_on"].split(",")
      show_events.forEach(show_event => MatestackUiVueJs.eventHub.$on(show_event.trim(), self.show));
    }

    if(this.props["hide_on"] != undefined){
      var show_events = this.props["hide_on"].split(",")
      show_events.forEach(show_event => MatestackUiVueJs.eventHub.$on(show_event.trim(), self.hide));
    }

    if(this.props["dispose_on"] != undefined){
      var show_events = this.props["dispose_on"].split(",")
      show_events.forEach(show_event => MatestackUiVueJs.eventHub.$on(show_event.trim(), self.dispose));
    }
  },

  beforeUnmount: function() {
    const self = this
    MatestackUiVueJs.eventHub.$off(this.props["show_on"], self.show);
    MatestackUiVueJs.eventHub.$off(this.props["hide_on"], self.hide);
    MatestackUiVueJs.eventHub.$off(this.props["dispose_on"], self.hide);
    if(this.props["show_on"] != undefined){
      var shown_events = this.props["show_on"].split(",")
      shown_events.forEach(show_event => MatestackUiVueJs.eventHub.$off(show_event.trim(), self.show));
    }
    if(this.props["hide_on"] != undefined){
      var hiden_events = this.props["hide_on"].split(",")
      hiden_events.forEach(hide_event => MatestackUiVueJs.eventHub.$off(hide_event.trim(), self.hide));
    }
    if(this.props["dispose_on"] != undefined){
      var hiden_events = this.props["dispose_on"].split(",")
      hiden_events.forEach(hide_event => MatestackUiVueJs.eventHub.$off(hide_event.trim(), self.dispose));
    }
  },
}

export default toastComponent
