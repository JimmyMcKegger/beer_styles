// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

const toggleToken = (event) => {
	const button = event.currentTarget;
	const index = button.getAttribute("data-index");
	const tokenSpan = document.getElementById(`token-value-${index}`);
	tokenSpan.classList.toggle("d-none");
	// console.log(button);
	// console.log(button.innerHTML);
	let text = button.innerHTML;
	if (text == "Hide") {
		button.innerHTML = "Show";
	} else {
		button.innerHTML = "Hide";
	}
};

const loopButtons = () => {
	const buttons = document.querySelectorAll(".show-token-buttons");
	for (let i = 0; i < buttons.length; i++) {
		buttons[i].addEventListener("click", (event) => toggleToken(event));
	}
};

document.addEventListener("turbo:load", loopButtons);
