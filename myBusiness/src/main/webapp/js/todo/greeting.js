const loginForm = document.querySelector("#login__form");
const loginInput = loginForm.querySelector("#login__input");
const greeting = document.querySelector("#greeting");
const greetingBtn = document.querySelector("#greeting-button");

const HIDDEN_CSS = "hidden";
const USERNAME_KEY = "username";

function loginHandler(event) {
    event.preventDefault();
    const username = loginInput.value;

    greetingBtn.innerText = "❌";

    loginForm.classList.add(HIDDEN_CSS);
    greeting.innerText = `Hello ${username}`;
    greeting.classList.remove(HIDDEN_CSS);
    greetingBtn.classList.remove(HIDDEN_CSS);

    localStorage.setItem(USERNAME_KEY, username);
}

function saveGreeting() {
    const saveUsername = localStorage.getItem(USERNAME_KEY);
    if (saveUsername === null) {
        loginForm.classList.remove(HIDDEN_CSS);
    } else {
        greeting.classList.remove(HIDDEN_CSS);
        greetingBtn.classList.remove(HIDDEN_CSS);
        greetingBtn.innerText = "❌";
        greeting.innerText = `Hello ${saveUsername}`;
    }
}

function loginDelete() {
    loginInput.value = "";
    loginForm.classList.remove(HIDDEN_CSS);
    greeting.classList.add(HIDDEN_CSS);
    greetingBtn.classList.add(HIDDEN_CSS);
}

saveGreeting();
greetingBtn.addEventListener("click", loginDelete);
loginForm.addEventListener("submit", loginHandler);
