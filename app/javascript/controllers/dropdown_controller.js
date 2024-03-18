import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle(event) {
    event.preventDefault(); // Prevent the default anchor link behavior
    if (this.menuTarget.style.display === "none" || !this.menuTarget.style.display) {
      this.menuTarget.style.display = "block";
    } else {
      this.menuTarget.style.display = "none";
    }
  }

  stopPropagation(event) {
    event.stopPropagation(); // This will stop the click from closing the dropdown
  }

  close() {
    this.menuTarget.style.display = "none";
  }

  clickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.close();
    }
  }
}
