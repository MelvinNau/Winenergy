import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['modal'];

  show() {
    this.modalTarget.classList.remove('hidden');
  }

  hide() {
    console.log('ppre')
    this.modalTarget.classList.add('hidden');
  }
}
