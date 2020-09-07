MatestackUiCore.Vue.component('matestack-ui-bootstrap-popover', {

  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      popoverInstance: undefined
    };
  },
  methods: {

  },
  mounted: function() {
    const self = this;
    var popover = self.$el
    if(this.componentConfig['dismissible'] == true){
      // initialize with dismissible settings
      self.popoverInstance = new bootstrap.Popover(
        
      )
    }
    else {
      // initialize normally
    }
  },
  created: function() {
  },

  beforeDestroy: function() {

  },
});