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
    minDate: "today",
  })
})
