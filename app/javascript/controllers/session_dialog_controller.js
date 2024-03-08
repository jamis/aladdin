import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'dialog', 'date', 'form' ];

  static outlets = [ 'tag-cloud' ];

  static values = {
    activityTags: Object
  }

  connect() {
    this.formTarget.reset();
  }

  activate(event) {
    this.show();
    this.setDate(event.detail.date);
  }

  show() {
    this.dialogTarget.classList.remove('hidden');
  }

  hide() {
    this.dialogTarget.classList.add('hidden');
  }

  setDate(date) {
    this.dateTargets.forEach((target) => {
      if (target.tagName == "INPUT") {
        target.value = date;
      } else {
        target.innerHTML = date;
      }
    })
  }

  activityChanged(event) {
    const activityId = event.target.value;
    const tags = this.activityTagsValue[activityId];
    this.tagCloudOutlet.selectOnly(tags || []);
  }
}
