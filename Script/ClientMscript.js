function openNewClientModal() {

    document.getElementById("addClientModal").style.display = "flex";

}
function closeClientModal() {

    document.getElementById("addClientModal").style.display = "none";

}


var currentClientTab = 0;

var clientTabIds = [
    "basicTab",
    "contactTab",
    "addressTab",
    "arrangementTab"
];

function showClientTab(tabId, button) {

    var contents = document.getElementsByClassName("client-tab-content");
    var tabs = document.getElementsByClassName("client-tab");

    for (var i = 0; i < contents.length; i++) {
        contents[i].classList.remove("active");
    }

    for (var i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove("active");
    }

    document.getElementById(tabId).classList.add("active");
    button.classList.add("active");

    currentClientTab = clientTabIds.indexOf(tabId);

    updateClientTabButtons();
}

function changeClientTab(direction) {

    var nextIndex = currentClientTab + direction;

    if (nextIndex < 0 || nextIndex >= clientTabIds.length) {
        return;
    }

    var tabs = document.getElementsByClassName("client-tab");

    showClientTab(clientTabIds[nextIndex], tabs[nextIndex]);
}

function updateClientTabButtons() {

    document.getElementById("previousClientTab").style.display =
        currentClientTab === 0 ? "none" : "inline-block";

    document.getElementById("nextClientTab").style.display =
        currentClientTab === clientTabIds.length - 1 ? "none" : "inline-block";

    document.getElementById("saveClientButton").style.display =
        currentClientTab === clientTabIds.length - 1 ? "inline-block" : "none";
}

function closeClientModal() {

    document.getElementById("addClientModal").style.display = "none";
}

// Initialize tab buttons
updateClientTabButtons();
