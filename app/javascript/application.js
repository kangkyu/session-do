import * as bootstrap from "bootstrap"
import "@hotwired/turbo-rails"

// import Datepicker from 'vanillajs-datepicker/Datepicker';
import { Datepicker } from "vanillajs-datepicker";

document.addEventListener("DOMContentLoaded", function() {
  const datepickerElements = document.querySelectorAll('input.datepicker_calendar');
  datepickerElements.forEach((element) => {
    const datePicker = new Datepicker(element, {
      format: 'yyyy-mm-dd',
      buttonClass: 'btn',
      todayHighlight: true,
    });
  });
});
