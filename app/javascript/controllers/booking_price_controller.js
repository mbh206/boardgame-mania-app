import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="booking-price"
export default class extends Controller {
  connect() {
    console.log("hi");
  //   flatpickr(".rental-date", {
  //     altInput: true,
  //     dateFormat: "Y-m-d",
  //     onChange: function(selectedDates, dateStr, instance) {
  //       this.update()
  //   },
  // })

  }

  static targets = ["start_date", "end_date", "price"];
  static values = { price: Number };

  update() {
    const pricePerDay = parseInt(this.priceValue, 10);

    // make sure the user has chosen a start date and end date
    if (
      this.start_dateTarget.value !== "" &&
      this.end_dateTarget.value !== ""
    ) {
      // calculating the time from the values in the HTML
      const diffInMs =
        new Date(this.end_dateTarget.value) -
        new Date(this.start_dateTarget.value);
      const diffInDays = diffInMs / (1000 * 60 * 60 * 24);
      console.log(diffInDays);

      if (diffInDays > 0) {
        // displays the total price per nigh
        // this.infoTarget.innerText = `¥${pricePerDay} x ${diffInDays} nights`;
        this.priceTarget.innerHTML = `<span>${(
          diffInDays * pricePerDay
        ).toLocaleString()}</span> <small class='fw-light'>total</small> `;
      } else if (diffInDays === 0) {
        // displays 1-night minimum if end date is same as start date
        this.infoTarget.innerText = "";
        this.priceTarget.innerHTML =
          "<span class='text-danger fw-light'>1-night mininum</span>";
      } else {
        // displays invalid if the end date is before the start or not overnight
        this.infoTarget.innerText = "";
        this.priceTarget.innerHTML =
          "<span class='text-danger fw-light'>Invalid dates</span>";
      }
    }
  }
}
