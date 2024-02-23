import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "control", "content" ];

  toggle(event) {
    if (this.state == 'closed')
      this.open();
    else
      this.close();
  }

  open() {
    this.contentTarget.classList.remove('hidden');
    this.controlTarget.classList.add('hidden');
  }

  close() {
    this.contentTarget.classList.add('hidden');
    this.controlTarget.classList.remove('hidden');
  }

  get state() {
    if (this.contentTarget.classList.contains('hidden'))
      return 'closed';
    else
      return 'open';
  }
}
