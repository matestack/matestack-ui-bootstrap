// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "./stylesheets/application.scss";

import { createApp } from 'vue'

import MatestackUiVueJs from 'matestack-ui-vuejs'
import MatestackUiBootstrap from 'matestack-ui-bootstrap';

import chartJsComponent from '../../matestack/dummy/components/chart_js.js'
import formFlatpickrComponent from '../../matestack/dummy/components/form/flatpickr.js'

import './stylesheets/rouge.scss.erb'
import '../../matestack/dummy/components/md.scss'

window.MatestackUiVueJs = MatestackUiVueJs // making MatestackUiVueJs globally available for test compatability
// MatestackUiVueJs.Vue = Vue // test compatability

const appInstance = createApp({})

MatestackUiBootstrap.registerComponents(appInstance)

appInstance.component("chart-js-component", chartJsComponent)
appInstance.component("form-flatpickr-component", formFlatpickrComponent)

document.addEventListener('DOMContentLoaded', () => {
  MatestackUiVueJs.mount(appInstance) // use this mount method
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
