// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
Rails.start()

import "stylesheets/application"
import "@fortawesome/fontawesome-free/js/all"
const images = require.context('../images', true)
import "flatpickr/dist/flatpickr.min.css"

import 'packs/notification'
import flatpickr from "flatpickr"

document.addEventListener('DOMContentLoaded', () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  })
})
