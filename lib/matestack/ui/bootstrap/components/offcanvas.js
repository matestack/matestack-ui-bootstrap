import * as bootstrap from 'bootstrap'
import MatestackUiVueJs from 'matestack-ui-vuejs'

const offcanvasComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,

  data() {
    return {
      offcanvasInstance: undefined,
    };
  },

  methods: {
    toggle: function (){
      this.offcanvasInstance.toggle()
    },
    show: function (){
      this.offcanvasInstance.show()
    },
    hide: function (){
      this.offcanvasInstance.hide()
    }
  },

  mounted: function() {
    const self = this
    const offcanvasElement = self.getElement()
    self.offcanvasInstance = new bootstrap.Offcanvas(offcanvasElement)
  },

  created: function() {
    const self = this
    var eventHub = MatestackUiVueJs.eventHub;
    // toggle_on event registration
    if(self.props["toggle_on"] != undefined){
      var toggle_events = self.props["toggle_on"].split(",")
      toggle_events.forEach(toggle_event => eventHub.$on(toggle_event.trim(), self.toggle));
    }
    // show_on event registration
    if(self.props["show_on"] != undefined){
      var show_events = self.props["show_on"].split(",")
      show_events.forEach(show_event => eventHub.$on(show_event.trim(), self.show));
    }
    // hide_on event registration
    if(self.props["hide_on"] != undefined){
      var hide_events = self.props["hide_on"].split(",")
      hide_events.forEach(hide_event => eventHub.$on(hide_event.trim(), self.hide));
    }
  },

  beforeUnmount: function() {
    const self = this
    var eventHub = MatestackUiVueJs.eventHub;
    if(self.props["toggle_on"] != undefined){
      var toggle_events = self.props["toggle_on"].split(",")
      toggle_events.forEach(toggle_event => eventHub.$off(toggle_event.trim(), self.toggle));
    }
    if(self.props["show_on"] != undefined){
      var show_events = self.props["show_on"].split(",")
      show_events.forEach(show_event => eventHub.$off(show_event.trim(), self.show));
    }
    if(self.props["hide_on"] != undefined){
      var hide_events = self.props["hide_on"].split(",")
      hide_events.forEach(hide_event => eventHub.$off(hide_event.trim(), self.hide));
    }
  },
}

export default offcanvasComponent
