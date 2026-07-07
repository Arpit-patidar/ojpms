/* ==========================================
        COMP PORTAL FINAL JS
========================================== */

document.addEventListener("DOMContentLoaded", () => {

console.log("COMP PORTAL READY");

/*==========================================
        LOADER
==========================================*/

const loader=document.getElementById("loader");

window.addEventListener("load",()=>{

setTimeout(()=>{

if(loader){

loader.style.opacity="0";
loader.style.visibility="hidden";

}

},1200);

});

/*==========================================
      CURSOR LIGHT
==========================================*/

const cursor=document.querySelector(".cursor-light");

document.addEventListener("mousemove",(e)=>{

if(cursor){

cursor.style.left=e.clientX+"px";

cursor.style.top=e.clientY+"px";

}

});

/*==========================================
      APPLE NAVBAR
==========================================*/

const navButtons=document.querySelectorAll(".nav-btn");

const activePill=document.getElementById("active-pill");

function movePill(btn){

if(!btn || !activePill) return;

activePill.style.width=btn.offsetWidth+"px";

activePill.style.height=btn.offsetHeight+"px";

activePill.style.transform=
`translateX(${btn.offsetLeft}px)`;

}

const active=document.querySelector(".nav-btn.active");

if(active){

setTimeout(()=>{

movePill(active);

},100);

}

navButtons.forEach(btn=>{

btn.addEventListener("click",()=>{

navButtons.forEach(b=>{

b.classList.remove("active");

});

btn.classList.add("active");

movePill(btn);

});

});

window.addEventListener("resize",()=>{

const active=document.querySelector(".nav-btn.active");

movePill(active);

});

/*==========================================
      GLARE EFFECT
==========================================*/

const nav=document.getElementById("nav");

const glare=document.getElementById("glare");

if(nav){

nav.addEventListener("mousemove",(e)=>{

const rect=nav.getBoundingClientRect();

const x=e.clientX-rect.left;

const y=e.clientY-rect.top;

if(glare){

glare.style.setProperty("--x",x+"px");

glare.style.setProperty("--y",y+"px");

}

});

}

/*==========================================
      THEME BUTTON
==========================================*/

const themeBtn=document.getElementById("theme-btn");

if(themeBtn){

themeBtn.addEventListener("click",()=>{

const root=document.documentElement;

let theme=root.getAttribute("data-theme");

if(theme==="light"){

theme="dark";

}

else if(theme==="dark"){

theme="classic";

}

else{

theme="light";

}

root.setAttribute("data-theme",theme);

localStorage.setItem("theme",theme);

});

}

/*==========================================
      LOAD SAVED THEME
==========================================*/

const savedTheme=localStorage.getItem("theme");

if(savedTheme){

document.documentElement.setAttribute(

"data-theme",

savedTheme

);

}

/*==========================================
      RIPPLE EFFECT
==========================================*/

document.addEventListener("click",(e)=>{

const ripple=document.createElement("span");

ripple.className="ripple";

ripple.style.left=e.pageX+"px";

ripple.style.top=e.pageY+"px";

document.body.appendChild(ripple);

setTimeout(()=>{

ripple.remove();

},700);

});

/*==========================================
      CARD HOVER
==========================================*/

document.querySelectorAll(

".card,.glass-card,.stat-box"

).forEach(card=>{

card.addEventListener("mouseenter",()=>{

card.style.transform=

"translateY(-10px) scale(1.03)";

});

card.addEventListener("mouseleave",()=>{

card.style.transform=

"translateY(0) scale(1)";

});

});

/*==========================================
      COUNTER
==========================================*/

const counters=document.querySelectorAll(".counter");

const speed=200;

counters.forEach(counter=>{

const update=()=>{

const target=+counter.getAttribute("data-target");

const count=+counter.innerText;

const inc=target/speed;

if(count<target){

counter.innerText=Math.ceil(count+inc);

requestAnimationFrame(update);

}else{

counter.innerText=target;

}

};

update();

});

/*==========================================
      SCROLL ANIMATION
==========================================*/

const observer=new IntersectionObserver(entries=>{

entries.forEach(entry=>{

if(entry.isIntersecting){

entry.target.classList.add("show");

}

});

},

{

threshold:0.2

});

document.querySelectorAll(

".card,.stat-box,.hero-left,.hero-right,.about,.workflow,.companies,.cta"

).forEach(el=>{

observer.observe(el);

});

/*==========================================
      ACTIVE NAV ON SCROLL
==========================================*/

const sections=document.querySelectorAll("section");

window.addEventListener("scroll",()=>{

let current="";

sections.forEach(section=>{

const top=section.offsetTop-150;

if(pageYOffset>=top){

current=section.getAttribute("id");

}

});

navButtons.forEach(link=>{

link.classList.remove("active");

const href=link.getAttribute("href");

if(href && href.includes(current)){

link.classList.add("active");

movePill(link);

}

});

});

/*==========================================
      SMOOTH SCROLL
==========================================*/

document.querySelectorAll('a[href^="#"]').forEach(anchor=>{

anchor.addEventListener("click",function(e){

e.preventDefault();

const target=document.querySelector(

this.getAttribute("href")

);

if(target){

target.scrollIntoView({

behavior:"smooth"

});

}

});

});

});