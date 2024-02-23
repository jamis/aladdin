import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    let el = this.element.querySelector('[autofocus]');
    if (el) el.focus();
  }
}
