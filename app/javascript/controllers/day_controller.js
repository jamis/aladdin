import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    date: String
  }

  select(event) {
    if (event.target.tagName == "A") return;

    let newEvent = new CustomEvent('day:selected', { bubbles: true, detail: { date: this.dateValue } })
    this.element.dispatchEvent(newEvent);
  }
}
