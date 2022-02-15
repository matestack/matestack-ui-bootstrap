import flatpickr from "flatpickr";
import MatestackUiVueJs from 'matestack-ui-vuejs'

const formFlatpickrComponent = {
  mixins: [MatestackUiVueJs.componentMixin, MatestackUiVueJs.formInputMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,
  data() {
    return {};
  },
  mounted: function(){
    flatpickr(this.getElement().querySelector('.flatpickr'), {
      defaultDate: this.props["init_value"],
      enableTime: (this.props["enable_time"] == true)
    });
  }
}

export default formFlatpickrComponent
