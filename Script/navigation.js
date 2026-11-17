//navigation loading
alert("JavaScript is connected!");
document.addEventListener("DOMContentLoaded", function() {

    var links = document.getElementsByClassName("nav-link");

    for (var i = 0; i < links.length; i++) {

        links[i].onclick = function(event) {

            event.preventDefault();

            var page = this.getAttribute("href");
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function() {

                if (xhr.readyState == 4) {

                    if (xhr.status == 200) {

                        var parser = new DOMParser();
                        var doc = parser.parseFromString(
                            xhr.responseText, "text/html"
                        );

                        var newContent = doc.querySelector(".page-content");
                        var mainContent = document.getElementById("main-content");

                        if (newContent && mainContent) {
                            mainContent.innerHTML = newContent.innerHTML;
                        } else {
                            mainContent.innerHTML = "Page content not found.";
                        }

                    } else {
                        alert("Unable to load page.");
                    }
                }
            };

            xhr.open("GET", page, true);
            xhr.send();
        };
    }
});
