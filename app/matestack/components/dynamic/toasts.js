// import matestackEventHub from '../js/event-hub'

MatestackUiCore.Vue.component('matestack-ui-bootstrap-toasts', {

  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      toastsInstance: undefined,
      showing: true,
      hide_after_timeout: null
    };
  },
  mounted() {
    // var myToasts = document.getElementById(this.componentConfig["toasts-id"])
    // this.toastsInstance = new bootstrap.Toast(myToasts, toast.show())
    
  },
  methods: {
    show: function(){
      
      var toastElList = [].slice.call(document.querySelectorAll('.toast'))
      var toastList = toastElList.map(function (toastEl) {
        return new bootstrap.Toast(toastEl, toast.show())
      })
      return toastList
    }
  },
  created: function() {
    const self = this

    if(this.componentConfig["show_on"] != undefined){
      this.showing = false
      var show_events = this.componentConfig["show_on"].split(",")
      show_events.forEach(show_event => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.show));
    }
  }
});