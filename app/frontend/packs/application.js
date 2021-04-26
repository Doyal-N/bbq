import "stylesheets/application"
import "@fortawesome/fontawesome-free/js/all"
const images = require.context('../images', true)
import "flatpickr/dist/flatpickr.min.css"

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()
Rails.start()

import 'packs/notification'
import 'packs/map'
import flatpickr from "flatpickr"

document.addEventListener('DOMContentLoaded', () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    minDate: "today",
  })
})
