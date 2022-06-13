// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within javascript and only use these pack files to reference
// that code so it'll be compiled.

import "./stylesheets/matestack-ui-bootstrap.scss";

import alertComponent from './components/alert'
import carouselComponent from './components/carousel'
import collapseComponent from './components/collapse'
import dropdownComponent from './components/dropdown'
import modalComponent from './components/modal'
import offcanvasComponent from './components/offcanvas'
import popoverComponent from './components/popover'
import toastComponent from './components/toast'
import tooltipComponent from './components/tooltip'
import sidebarComponent from './layout/sidebar'
import './layout/sidebar.scss'
import './content/smart_collection/collection.scss'

const registerComponents = function(appInstance){
  appInstance.component('matestack-ui-bootstrap-alert', alertComponent)
  appInstance.component('matestack-ui-bootstrap-carousel', carouselComponent)
  appInstance.component('matestack-ui-bootstrap-collapse', collapseComponent)
  appInstance.component('matestack-ui-bootstrap-dropdown', dropdownComponent)
  appInstance.component('matestack-ui-bootstrap-modal', modalComponent)
  appInstance.component('matestack-ui-bootstrap-offcanvas', offcanvasComponent)
  appInstance.component('matestack-ui-bootstrap-popover', popoverComponent)
  appInstance.component('matestack-ui-bootstrap-toast', toastComponent)
  appInstance.component('matestack-ui-bootstrap-tooltip', tooltipComponent)
  appInstance.component('matestack-ui-bootstrap-sidebar', sidebarComponent)

  return appInstance
}

const MatestackUiBootstrap = {
  registerComponents
}

window.MatestackUiBootstrap = MatestackUiBootstrap

export default MatestackUiBootstrap
