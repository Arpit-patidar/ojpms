/* =========================
   MOUSE GLOW
========================= */

const glow =
document.createElement("div");

glow.className =
"mouse-glow";

document.body.appendChild(
glow
);

document.addEventListener(
"mousemove",
(e)=>{

glow.style.left=
e.clientX+"px";

glow.style.top=
e.clientY+"px";

}
);

/* =========================
   CARD TILT
========================= */

const card =
document.querySelector(
".login-card"
);

if(card){

card.addEventListener(
"mousemove",
(e)=>{

const rect =
card.getBoundingClientRect();

const x =
e.clientX-rect.left;

const y =
e.clientY-rect.top;

const rotateX =
-(y-rect.height/2)/18;

const rotateY =
(x-rect.width/2)/18;

card.style.transform=
`rotateX(${rotateX}deg)
 rotateY(${rotateY}deg)
 scale(1.03)`;

});

card.addEventListener(
"mouseleave",
()=>{

card.style.transform=
"rotateX(0deg) rotateY(0deg) scale(1)";

});

}

/* =========================
   TYPING EFFECT
========================= */

const heading =
document.querySelector(
".left-panel h1"
);

if(heading){

const text =
"BUILD YOUR CAREER LIKE A PRO GAMER";

heading.innerHTML="";

let i=0;

function typing(){

if(i<text.length){

heading.innerHTML +=
text.charAt(i);

i++;

setTimeout(
typing,
40
);

}

}

typing();

}

/* =========================
   FLOATING PARTICLES
========================= */

function createParticle(){

const particle =
document.createElement(
"span"
);

particle.classList.add(
"dynamic-particle"
);

particle.style.left =
Math.random()*100+"%";

particle.style.animationDuration =
(5+Math.random()*8)+"s";

document.body.appendChild(
particle
);

setTimeout(
()=>{
particle.remove();
},
12000
);

}

setInterval(
createParticle,
250
);

/* =========================
   RIPPLE EFFECT
========================= */

document
.querySelectorAll(
".login-btn"
)
.forEach(btn=>{

btn.addEventListener(
"click",
function(e){

const ripple =
document.createElement(
"span"
);

const rect =
this.getBoundingClientRect();

const size =
Math.max(
rect.width,
rect.height
);

ripple.style.width=
size+"px";

ripple.style.height=
size+"px";

ripple.style.left=
e.clientX-
rect.left-
size/2+"px";

ripple.style.top=
e.clientY-
rect.top-
size/2+"px";

ripple.className=
"ripple";

this.appendChild(
ripple
);

setTimeout(
()=>{
ripple.remove();
},
600
);

});

});

/* =========================
   COUNTER
========================= */

document
.querySelectorAll(
".stat-box h2"
)
.forEach(item=>{

const target=
parseInt(
item.innerText.replace(
/\D/g,
""
)
);

let count=0;

const interval=
setInterval(()=>{

count+=
Math.ceil(
target/60
);

if(count>=target){

count=target;

clearInterval(
interval
);

}

item.innerText=
count+"+";

},25);

});

/* =========================
   PASSWORD TOGGLE
========================= */

const pass=
document.getElementById(
"password"
);

if(pass){

const eye=
document.createElement(
"span"
);

eye.innerHTML="👁";

eye.className=
"eye-icon";

pass.parentElement
.appendChild(
eye
);

eye.addEventListener(
"click",
()=>{

pass.type=
pass.type==="password"
?"text"
:"password";

});

}

/* =========================
   CYBER CLOCK
========================= */

function updateClock(){

let clock=
document.getElementById(
"cyberClock"
);

if(!clock){

clock=
document.createElement(
"div"
);

clock.id=
"cyberClock";

clock.style.position=
"fixed";

clock.style.top=
"20px";

clock.style.right=
"20px";

clock.style.color=
"#00ffff";

clock.style.fontSize=
"18px";

clock.style.zIndex=
"999";

document.body.appendChild(
clock
);

}

clock.innerHTML=
new Date()
.toLocaleTimeString();

}

setInterval(
updateClock,
1000
);

updateClock();

/* =========================
   LOGO FLICKER
========================= */

setInterval(()=>{

const logo=
document.querySelector(
".logo-text"
);

if(logo){

logo.style.opacity=
".6";

setTimeout(
()=>{
logo.style.opacity=
"1";
},
100
);

}

},3000);