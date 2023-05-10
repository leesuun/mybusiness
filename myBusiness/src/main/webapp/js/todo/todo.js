const toDoForm = document.querySelector("#todo-form");
const toDoInput = toDoForm.querySelector("input");
const toDoList = document.querySelector("#todo-list");

const TODOS_KEY = "toDos";
let toDos = [];

function deleteToDo(toDo) {
    const li = toDo.target.parentNode;
    toDoList.removeChild(li);

    toDos = toDos.filter((toDo) => parseInt(li.id) !== toDo.id);
    saveTodos();
}

function saveTodos() {
    localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
}

function paintToDos(newToDosObj) {
    const li = document.createElement("li");
    const span = document.createElement("span");
    const button = document.createElement("button");

    button.innerText = "❌";
    span.innerText = newToDosObj.text;

    li.id = newToDosObj.id;
    li.appendChild(span);
    li.appendChild(button);
    toDoList.appendChild(li);

    button.addEventListener("click", deleteToDo);
}

function toDoHandleSubmit(event) {
    event.preventDefault();
    const newToDo = toDoInput.value;
    toDoInput.value = "";

    const newToDosObj = {
        text: newToDo,
        id: Date.now(),
    };

    toDos.push(newToDosObj);
    paintToDos(newToDosObj);
    saveTodos();
}

const savedToDos = localStorage.getItem(TODOS_KEY);

if (savedToDos !== null) {
    const parseToDos = JSON.parse(savedToDos);

    toDos = parseToDos;
    parseToDos.forEach(paintToDos);
} else {
}

toDoForm.addEventListener("submit", toDoHandleSubmit);
