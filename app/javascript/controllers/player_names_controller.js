import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="player-names"
export default class extends Controller {
  static targets = ["fields"]

  addField() {
    const newField = document.createElement("input")
    newField.setAttribute("type", "text")
    newField.setAttribute("name", "game[player_names][]")
    newField.setAttribute("class", "mt-2")
    this.fieldsTarget.appendChild(newField)
  }
}
