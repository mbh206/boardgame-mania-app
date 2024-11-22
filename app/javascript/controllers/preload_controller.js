import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preload"
export default class extends Controller {

  connect() {
    console.log("hello");
    const items = JSON.parse(this.data.get("boardgames"))
    console.log(items.length);
    items.forEach(element => {
      (new Image()).src=element;
    });
    
  }

  

}
