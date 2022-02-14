import * as bootstrap from 'bootstrap'
import MatestackUiVueJs from 'matestack-ui-vuejs'

const modalComponent = {
  mixins: [MatestackUiVueJs.componentMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,

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
    var modal = self.getElement()
    self.modalInstance = new bootstrap.Modal(modal)
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
    // handle_update_on event registration
    if(self.props["handle_update_on"] != undefined){
      var handle_update_events = self.props["handle_update_on"].split(",")
      handle_update_events.forEach(handle_update_event => eventHub.$on(handle_update_event.trim(), self.handle_update));
    }
    // dispose_on event registration
    if(self.props["dispose_on"] != undefined){
      var dispose_events = self.props["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => eventHub.$on(dispose_event.trim(), self.dispose));
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
    if(self.props["handle_update_on"] != undefined){
      var handle_update_events = self.props["handle_update_on"].split(",")
      handle_update_events.forEach(handle_update_event => eventHub.$off(handle_update_event.trim(), self.handle_update));
    }
    if(self.props["dispose_on"] != undefined){
      var dispose_events = self.props["dispose_on"].split(",")
      dispose_events.forEach(dispose_event => eventHub.$off(dispose_event.trim(), self.dispose));
    }
  },
}

export default modalComponent
