import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'field', 'input', 'template' ];

  static values = {
    tags: Array
  }

  static classes = [ 'selected' ];

  connect() {
    this.populateCloud();
  }

  toggle(event) {
    let tag = event.params.tag;

    let list = this.selectedTags;
    let idx = list.indexOf(tag);

    if (idx >= 0) {
      list.splice(idx, 1);
      event.target.classList.remove(this.selectedClass);
    } else {
      list.push(tag);
      event.target.classList.add(this.selectedClass);
    }

    this.fieldTarget.value = JSON.stringify(list);
    this.selectedTags = list;
  }

  selectOnly(list) {
    this.fieldTarget.value = JSON.stringify(list);
    this.selectedTags = list;

    this.element.querySelectorAll('.bcal-tag').forEach(node => {
      let tag = node.dataset.tagCloudTagParam;
      if (list.includes(tag)) {
        node.classList.add(this.selectedClass);
      } else {
        node.classList.remove(this.selectedClass);
      }
    });
  }

  populateCloud() {
    let selected = this.selectedTags;
    this.tagsValue.forEach(tag => {
      this.addTag(tag, selected.includes(tag));
    });
  }

  addTag(tag, selected) {
    let node = this.cloneTemplate();

    let div = node.querySelector('div');
    div.dataset.tagCloudTagParam = tag;
    div.innerHTML = tag;

    if (selected) div.classList.add(this.selectedClass);

    this.element.insertBefore(node, this.inputTarget);
  }

  newTag(event) {
    let tag = event.target.value;
    event.target.value = '';

    this.tagsValue = this.tagsValue.concat([ tag ]);

    let list = this.selectedTags;
    list.push(tag);
    this.selectedTags = list;

    this.addTag(tag, true)
  }

  get selectedTags() {
    return JSON.parse(this.fieldTarget.value);
  }

  set selectedTags(list) {
    this.fieldTarget.value = JSON.stringify(list);
  }

  cloneTemplate() {
    return this.templateTarget.content.cloneNode(true);
  }
}
