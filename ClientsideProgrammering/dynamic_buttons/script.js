var input = document.getElementsByClassName("input")[0];
var view2 = document.getElementsByClassName("view2")[0];

var btnId = 0;
lastBtn = null;

function Add() {
    var btn = document.createElement("button");

    btn.innerText = input.value;
    btn.className = btnId++;
    btn.addEventListener("click", () => UpdateLastPressed(btn));
    btn.style.setProperty("border-color", "grey");

    view2.appendChild(btn);   
}

function Delete() {
    if (lastBtn != null)
        lastBtn.remove();
}

function Change() { 
    if (lastBtn != null)
        lastBtn.innerText = input.value;
}

function UpdateLastPressed(btn) {
    if (lastBtn != null)
        lastBtn.style.setProperty("border-color", "grey");

    lastBtn = btn;
    lastBtn.style.setProperty("border-color", "green");
}