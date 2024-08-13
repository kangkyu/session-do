import * as bootstrap from "bootstrap"
import "@hotwired/turbo-rails"

// import Datepicker from 'vanillajs-datepicker/Datepicker';
import { Datepicker } from "vanillajs-datepicker";

document.addEventListener("DOMContentLoaded", function() {
  const datepickerElements = document.querySelectorAll('.datepicker');
  datepickerElements.forEach((element) => {
    new Datepicker(element, {
      buttonClass: 'btn',
    });
  });
});
