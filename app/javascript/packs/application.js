// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import bootstrap from 'bootstrap';
import flatpickr from "flatpickr";

import MatestackUiCore from 'matestack-ui-core';

import "./stylesheets/application.scss"; //including bootstrap scss

import '../../matestack/bootstrap/components/alert'
import '../../matestack/bootstrap/components/carousel'
import '../../matestack/bootstrap/components/chart'
import '../../matestack/bootstrap/components/collapse'
import '../../matestack/bootstrap/components/dropdown'
import '../../matestack/bootstrap/components/modal'
import '../../matestack/bootstrap/components/toast'
import '../../matestack/bootstrap/components/popover'
import '../../matestack/bootstrap/components/tooltip'
import '../../matestack/bootstrap/form/date'
import '../../matestack/bootstrap/layout/sidebar'
import '../../matestack/bootstrap/layout/sidebar.scss'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
