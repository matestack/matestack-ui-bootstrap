MatestackUiCore.Vue.component('matestack-ui-bootstrap-alert', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      alertInstance: undefined
    };
  },
  mounted() {
    var myAlert = document.getElementById(this.componentConfig["alert-id"])
    this.alertInstance = new bootstrap.Alert(myAlert)
    // var alertNode = document.querySelector('.alert')
    // var alert = bootstrap.Alert.getInstance(alertNode)
    // alert.close()
  }
});