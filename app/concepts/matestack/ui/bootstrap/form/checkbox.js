MatestackUiCore.Vue.component('matestack-ui-bootstrap-form-checkbox', {
  mixins: [MatestackUiCore.componentMixin, MatestackUiCore.formCheckboxMixin],
  data() {
    return {};
  },
  methods: {
    afterInitialize: function(value){
      // optional: if you need to modify the initial value
      // use this.setValue(xyz) in order to change the value
      // this method can be used in other methods or mounted hook of this component as well!
      // this.setValue(xyz)
    }
  },
  mounted: function(){
    // use/initialize any third party library here
    // you can access the default initial value via this.componentConfig["init_value"]
    // if you need to, you can access your own component config data which added
    // within the prepare method of the corresponding Ruby class
    // this.componentConfig["foo"] would be "bar" in this case
  }
});
