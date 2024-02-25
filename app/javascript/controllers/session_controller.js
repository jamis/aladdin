import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    session: Number,
    engagementsUrl: String
  };

  connect() {
    this.noteTimers = {};
  }

  toggleInvited(event) {
    let element = event.target;
    this.setPending(element);
    this.submitRequestFor(element, { invited: element.checked });
  }

  toggleAttended(event) {
    let element = event.target;
    this.setPending(element);
    this.submitRequestFor(element, { attended: element.checked });
  }

  updateNotes(event) {
    let element = event.target;
    let request = this.noteTimers[element.id];

    if (!request) {
      this.setPending(element);
      this.noteTimers[element.id] = setTimeout(() => this.saveNote(element), 1000);
    }
  }

  saveNote(element) {
    delete this.noteTimers[element.id];
    this.submitRequestFor(element, { notes: element.value });
  }

  getResidentFor(element) {
    return element.closest('[data-resident]').dataset.resident;
  }

  submitRequestFor(element, payload) {
    let resident = this.getResidentFor(element);

    payload.resident_id = resident;
    payload.session_id = this.sessionValue;

    let csrfParam = document.querySelector('meta[name="csrf-param"]').content;
    let csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    payload = { engagement: payload };
    payload[csrfParam] = csrfToken;

    const response = fetch(this.engagementsUrlValue, {
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(payload)
    });

    response.then((data) => {
      if (data.status != 204) {
        alert('could not save changes');
        window.location.reload();
      } else {
        this.clearPending(element);
      }
    });
  }

  setPending(element) {
    let tr = element.closest('tr');

    let count = parseInt(tr.dataset.pendingRequests || 0);

    if (count == 0)
      tr.classList.add('bg-yellow-100');

    tr.dataset.pendingRequests = count + 1;
  }

  clearPending(element) {
    let tr = element.closest('tr');

    let count = tr.dataset.pendingRequests - 1;
    tr.dataset.pendingRequests = count;

    if (count == 0)
      tr.classList.remove('bg-yellow-100');
  }
}
