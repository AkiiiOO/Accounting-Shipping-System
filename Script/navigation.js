
// Navigation Loading
document.addEventListener("DOMContentLoaded", function() {

    var links = document.getElementsByClassName("nav-link");

    for (var i = 0; i < links.length; i++) {

        links[i].addEventListener("click", function(event) {

            event.preventDefault();

            // Get the complete page URL
            var page = this.href;

            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function() {

                if (xhr.readyState === 4) {

                    if (xhr.status === 200) {

                        var parser = new DOMParser();

                        var doc = parser.parseFromString(
                            xhr.responseText,
                            "text/html"
                        );

                        var newContent = doc.querySelector(".page-content");
                        var mainContent = document.getElementById("main-content");

                        if (newContent && mainContent) {

                            mainContent.innerHTML = newContent.innerHTML;

                            // Update browser URL
                            history.pushState(null, "", page);

                        } else {

                            console.error("Page content not found:", page);
                            alert("Unable to find page content.");

                        }

                    } else {

                        console.error("HTTP Error:", xhr.status, page);
                        alert("Unable to load page.");

                    }

                }

            };

            xhr.open("GET", page, true);
            xhr.send();

        });

    }

});
