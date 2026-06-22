const canvas = document.getElementById("matrixCanvas");

if(canvas){

const ctx = canvas.getContext("2d");

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

const chars =
"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*";

const fontSize = 16;

let columns =
Math.floor(canvas.width / fontSize);

let drops = [];

for(let i=0;i<columns;i++){
    drops[i]=1;
}

function drawMatrix(){

    ctx.fillStyle =
    "rgba(5,8,22,0.08)";

    ctx.fillRect(
        0,
        0,
        canvas.width,
        canvas.height
    );

    ctx.fillStyle="#00ff88";

    ctx.font=
    fontSize+"px monospace";

    for(let i=0;i<drops.length;i++){

        const text=
        chars.charAt(
            Math.floor(
                Math.random()*chars.length
            )
        );

        ctx.fillText(
            text,
            i*fontSize,
            drops[i]*fontSize
        );

        if(
            drops[i]*fontSize >
            canvas.height &&
            Math.random()>0.975
        ){
            drops[i]=0;
        }

        drops[i]++;
    }
}

setInterval(drawMatrix,35);

window.addEventListener(
"resize",
()=>{

canvas.width=
window.innerWidth;

canvas.height=
window.innerHeight;

columns=
Math.floor(
canvas.width/fontSize
);

drops=[];

for(let i=0;i<columns;i++){
drops[i]=1;
}

});

}