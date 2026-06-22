/* ==========================================
   COMP PORTAL FINAL JS
========================================== */

document.addEventListener("DOMContentLoaded", () => {

    console.log("COMP PORTAL LOADED");

    /* ==========================
       TOPBAR SCROLL EFFECT
    ========================== */

    const topbar = document.querySelector(".topbar");

    window.addEventListener("scroll", () => {

        if (window.scrollY > 50) {
            topbar.classList.add("topbar-scroll");
        } else {
            topbar.classList.remove("topbar-scroll");
        }

    });

    /* ==========================
       BUTTON LOADING
    ========================== */

    const form = document.querySelector("form");

    if (form) {

        form.addEventListener("submit", () => {

            const btn =
                document.querySelector(".login-btn");

            if (btn) {

                btn.innerHTML =
                    "PROCESSING...";

                btn.disabled = true;
            }

        });

    }

    /* ==========================
       CARD HOVER EFFECT
    ========================== */

    document.querySelectorAll(
        ".feature-card,.stat-box"
    ).forEach(card => {

        card.addEventListener(
            "mouseenter",
            () => {

                card.style.transform =
                    "translateY(-8px) scale(1.03)";
            }
        );

        card.addEventListener(
            "mouseleave",
            () => {

                card.style.transform =
                    "translateY(0) scale(1)";
            }
        );

    });

    /* ==========================
       CURSOR LIGHT FOLLOW
    ========================== */

    const cursor =
        document.querySelector(".cursor-light");

    if (cursor) {

        document.addEventListener(
            "mousemove",
            e => {

                cursor.style.left =
                    e.clientX + "px";

                cursor.style.top =
                    e.clientY + "px";
            }
        );

    }

    /* ==========================
       RIPPLE EFFECT
    ========================== */

    document.addEventListener(
        "click",
        function(e){

            const ripple =
                document.createElement("span");

            ripple.classList.add("ripple");

            ripple.style.left =
                e.pageX + "px";

            ripple.style.top =
                e.pageY + "px";

            document.body.appendChild(
                ripple
            );

            setTimeout(() => {

                ripple.remove();

            },600);

        }
    );

}); 