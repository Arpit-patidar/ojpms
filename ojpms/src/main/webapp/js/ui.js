
/* =========================
   NAVBAR BLUR ON SCROLL
========================= */

const navbar = document.querySelector(".navbar");

window.addEventListener("scroll", () => {

    if (window.scrollY > 50) {
        navbar.style.background = "rgba(2,12,8,0.85)";
        navbar.style.backdropFilter = "blur(25px)";
        navbar.style.borderBottom = "1px solid rgba(0,255,136,0.25)";
    } else {
        navbar.style.background = "rgba(2,12,8,0.6)";
        navbar.style.backdropFilter = "blur(15px)";
        navbar.style.borderBottom = "1px solid rgba(0,255,136,0.1)";
    }
});

/* =========================
   SCROLL REVEAL SYSTEM
========================= */

const revealElements = document.querySelectorAll(
    ".card, .timeline-item, .stat-box, .glass-card, .hero-left, .hero-right"
);

const observer = new IntersectionObserver((entries) => {

    entries.forEach(entry => {

        if (entry.isIntersecting) {

            entry.target.style.opacity = 1;
            entry.target.style.transform = "translateY(0) scale(1)";

            entry.target.style.transition = "0.8s ease";

        } else {
            entry.target.style.opacity = 0;
            entry.target.style.transform = "translateY(40px) scale(0.95)";
        }

    });

}, { threshold: 0.15 });

revealElements.forEach(el => {
    el.style.opacity = 0;
    el.style.transform = "translateY(40px) scale(0.95)";
    observer.observe(el);
});

/* =========================
   TYPING EFFECT (HERO)
========================= */

const heroText = document.querySelector(".hero-left h1");

if (heroText) {

    const text = heroText.innerText;
    heroText.innerText = "";

    let i = 0;

    function typeEffect() {

        if (i < text.length) {
            heroText.innerHTML += text.charAt(i);
            i++;
            setTimeout(typeEffect, 40);
        }
    }

    setTimeout(typeEffect, 500);
}

/* =========================
   ACTIVE NAV LINK
========================= */

const links = document.querySelectorAll(".nav-links a");

links.forEach(link => {

    link.addEventListener("click", () => {

        links.forEach(l => l.classList.remove("active"));

        link.classList.add("active");
    });
});

/* =========================
   RIPPLE CLICK EFFECT
========================= */

document.addEventListener("click", (e) => {

    const ripple = document.createElement("div");

    ripple.style.position = "fixed";
    ripple.style.width = "10px";
    ripple.style.height = "10px";
    ripple.style.borderRadius = "50%";
    ripple.style.background = "rgba(0,255,136,0.5)";
    ripple.style.left = e.clientX + "px";
    ripple.style.top = e.clientY + "px";
    ripple.style.pointerEvents = "none";
    ripple.style.transform = "translate(-50%, -50%)";
    ripple.style.animation = "rippleAnim 0.6s ease-out";

    document.body.appendChild(ripple);

    setTimeout(() => ripple.remove(), 600);
});

/* =========================
   RIPPLE ANIMATION STYLE
========================= */

const style = document.createElement("style");

style.innerHTML = `
@keyframes rippleAnim {
    from {
        opacity: 1;
        transform: translate(-50%, -50%) scale(1);
    }
    to {
        opacity: 0;
        transform: translate(-50%, -50%) scale(20);
    }
}
`;

document.head.appendChild(style);

/* =========================
   SIMPLE SECTION TITLE FX
========================= */

const titles = document.querySelectorAll("h2");

titles.forEach(title => {

    title.addEventListener("mouseenter", () => {
        title.style.textShadow = "0 0 20px #00ff88, 0 0 40px #00ff88";
        title.style.transform = "scale(1.02)";
    });

    title.addEventListener("mouseleave", () => {
        title.style.textShadow = "none";
        title.style.transform = "scale(1)";
    });
});

/* =========================
   LOADER SAFETY HANDLING
========================= */

window.addEventListener("load", () => {

    const loader = document.getElementById("loader");

    if (loader) {

        setTimeout(() => {
            loader.style.opacity = "0";
            loader.style.transition = "0.8s ease";
        }, 800);

        setTimeout(() => {
            loader.style.display = "none";
        }, 1600);
    }
});

/* =========================
   SCROLL TO TOP SMOOTH FEEL
========================= */

document.documentElement.style.scrollBehavior = "smooth";

/* =========================
   END UI ENGINE
========================= */