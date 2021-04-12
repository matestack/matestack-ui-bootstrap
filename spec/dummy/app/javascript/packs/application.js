// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "./stylesheets/application.scss";

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'

import MatestackUiCore from 'matestack-ui-core';
import MatestackUiBootstrap from 'matestack-ui-bootstrap';

window.MatestackUiCore = MatestackUiCore // making MatestackUiCore globally available for test compatability
MatestackUiCore.Vue = Vue // test compatability


console.log("fooo")
let matestackUiApp = undefined

document.addEventListener('DOMContentLoaded', () => {
  matestackUiApp = new Vue({
    el: "#matestack-ui",
    store: MatestackUiCore.store
  })
})

import '../../matestack/dummy/components/chart_js.js'
import '../../matestack/dummy/components/form/flatpickr.js'

import './stylesheets/rouge.scss.erb'
import '../../matestack/dummy/components/md.scss'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
