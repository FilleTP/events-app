import { Controller } from "@hotwired/stimulus"
import $ from "jquery"
import "daterangepicker"

export default class extends Controller {
  connect() {
    $(this.element).daterangepicker({
      locale: {
        format: 'YYYY-MM-DD',
      },
      minDate: new Date()
    });
  }
}
