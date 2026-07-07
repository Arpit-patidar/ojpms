/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 1A
========================================== */

const scene = new THREE.Scene();
scene.background = null;
scene.fog = new THREE.FogExp2(0x000814, 0.0015);

/* ==========================================
        CAMERA
========================================== */

const camera = new THREE.PerspectiveCamera(
    65,
    window.innerWidth / window.innerHeight,
    0.1,
    3000
);

camera.position.set(0, 0, 220);

/* ==========================================
        RENDERER
========================================== */

const renderer = new THREE.WebGLRenderer({
    alpha: true,
    antialias: true,
    powerPreference: "high-performance"
});

renderer.setPixelRatio(
    Math.min(window.devicePixelRatio, 2)
);

renderer.setSize(
    window.innerWidth,
    window.innerHeight
);

if (THREE.SRGBColorSpace) {
    renderer.outputColorSpace = THREE.SRGBColorSpace;
} else {
    renderer.outputEncoding = THREE.sRGBEncoding;
}

renderer.toneMapping = THREE.ACESFilmicToneMapping;
renderer.toneMappingExposure = 1.2;

renderer.domElement.style.position = "fixed";
renderer.domElement.style.left = "0";
renderer.domElement.style.top = "0";
renderer.domElement.style.width = "100%";
renderer.domElement.style.height = "100%";
renderer.domElement.style.pointerEvents = "none";
renderer.domElement.style.zIndex = "-20";

document.body.appendChild(renderer.domElement);

/* ==========================================
        GROUPS
========================================== */

const universe = new THREE.Group();

const starLayer = new THREE.Group();

const nebulaLayer = new THREE.Group();

const cubeLayer = new THREE.Group();

scene.add(universe);

universe.add(starLayer);
universe.add(nebulaLayer);
universe.add(cubeLayer);

/* ==========================================
        COLORS
========================================== */

const palette = [

    0x00ffff,
    0xff4fd8,
    0x8b5cf6,
    0xffd700,
    0x00ff88,
    0xffffff,
    0x5ee7ff,
    0xff8844,
    0x44ffcc

];

function randomColor() {

    return palette[
        Math.floor(
            Math.random() * palette.length
        )
    ];

}

/* ==========================================
        STAR FIELD
========================================== */

const STAR_COUNT = 10000;

const starGeometry =
    new THREE.BufferGeometry();

const starPositions =
    new Float32Array(
        STAR_COUNT * 3
    );

const starColors =
    new Float32Array(
        STAR_COUNT * 3
    );

const baseStarColors =
    new Float32Array(
        STAR_COUNT * 3
    );

for (let i = 0; i < STAR_COUNT; i++) {

    const radius =
        900 * Math.random();

    const theta =
        Math.random() * Math.PI * 2;

    const phi =
        Math.acos(
            (2 * Math.random()) - 1
        );

    const x =
        radius *
        Math.sin(phi) *
        Math.cos(theta);

    const y =
        radius *
        Math.sin(phi) *
        Math.sin(theta);

    const z =
        radius *
        Math.cos(phi);

    starPositions[i * 3] = x;
    starPositions[i * 3 + 1] = y;
    starPositions[i * 3 + 2] = z;

    const c =
        new THREE.Color(
            randomColor()
        );

    starColors[i * 3] = c.r;
    starColors[i * 3 + 1] = c.g;
    starColors[i * 3 + 2] = c.b;

    baseStarColors[i * 3] = c.r;
    baseStarColors[i * 3 + 1] = c.g;
    baseStarColors[i * 3 + 2] = c.b;

}

starGeometry.setAttribute(

    "position",

    new THREE.BufferAttribute(
        starPositions,
        3
    )

);

starGeometry.setAttribute(

    "color",

    new THREE.BufferAttribute(
        starColors,
        3
    )

);

const starMaterial =
    new THREE.PointsMaterial({

        size: 2.3,

        vertexColors: true,

        transparent: true,

        opacity: .95,

        depthWrite: false,

        blending:
            THREE.AdditiveBlending

    });

const stars =
    new THREE.Points(
        starGeometry,
        starMaterial
    );

starLayer.add(stars);

/* ==========================================
        SECOND STAR FIELD
========================================== */

const farGeometry =
    new THREE.BufferGeometry();

const farPos =
    new Float32Array(
        7000 * 3
    );

for (let i = 0; i < 7000; i++) {

    farPos[i * 3] =
        (Math.random() - .5) * 2400;

    farPos[i * 3 + 1] =
        (Math.random() - .5) * 2400;

    farPos[i * 3 + 2] =
        (Math.random() - .5) * 2400;

}

farGeometry.setAttribute(

    "position",

    new THREE.BufferAttribute(
        farPos,
        3
    )

);

const farMaterial =
    new THREE.PointsMaterial({

        color: 0xffffff,

        size: .8,

        transparent: true,

        opacity: .45,

        depthWrite: false,

        blending:
            THREE.AdditiveBlending

    });

const farStars =
    new THREE.Points(
        farGeometry,
        farMaterial
    );

starLayer.add(farStars);

/* ==========================================
        AMBIENT LIGHT
========================================== */

const ambientLight =
    new THREE.AmbientLight(
        0xffffff,
        1.5
    );

scene.add(ambientLight);
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 1B
========================================== */

/*==========================================
        RGB STAR CLUSTERS
==========================================*/

const clusterGroup = new THREE.Group();
scene.add(clusterGroup);

const clusters = [];

for(let i=0;i<80;i++){

    const geo = new THREE.SphereGeometry(
        1.2 + Math.random()*2,
        10,
        10
    );

    const mat = new THREE.MeshBasicMaterial({

        color: randomColor(),

        transparent:true,

        opacity:.75

    });

    const star = new THREE.Mesh(
        geo,
        mat
    );

    star.position.set(

        (Math.random()-.5)*1800,

        (Math.random()-.5)*1200,

        (Math.random()-.5)*1800

    );

    star.userData.speed =
    .2 + Math.random()*.8;

    star.userData.offset =
    Math.random()*100;

    clusters.push(star);

    clusterGroup.add(star);

}

/*==========================================
        STAR HALOS
==========================================*/

const haloGroup = new THREE.Group();
scene.add(haloGroup);

const halos = [];

for(let i=0;i<60;i++){

    const halo = new THREE.Mesh(

        new THREE.RingGeometry(
            5,
            6,
            40
        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.08,

            side:THREE.DoubleSide,

            blending:
            THREE.AdditiveBlending

        })

    );

    halo.position.set(

        (Math.random()-.5)*1400,

        (Math.random()-.5)*900,

        (Math.random()-.5)*1400

    );

    halo.rotation.x=Math.PI/2;

    halo.userData.speed=

    .001+

    Math.random()*.003;

    halos.push(halo);

    haloGroup.add(halo);

}

/*==========================================
        FLOATING LIGHTS
==========================================*/

const lightGroup=new THREE.Group();

scene.add(lightGroup);

const floatingLights=[];

for(let i=0;i<140;i++){

    const light=new THREE.Mesh(

        new THREE.SphereGeometry(
            .7,
            8,
            8
        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.8

        })

    );

    light.position.set(

        (Math.random()-.5)*1600,

        (Math.random()-.5)*900,

        (Math.random()-.5)*1600

    );

    light.userData.offset=

    Math.random()*100;

    floatingLights.push(light);

    lightGroup.add(light);

}

/*==========================================
        BACKGROUND PARTICLES
==========================================*/

const bgGeometry=
new THREE.BufferGeometry();

const bgPos=
new Float32Array(8000*3);

for(let i=0;i<8000;i++){

    bgPos[i*3]=
    (Math.random()-.5)*4000;

    bgPos[i*3+1]=
    (Math.random()-.5)*4000;

    bgPos[i*3+2]=
    (Math.random()-.5)*4000;

}

bgGeometry.setAttribute(

"position",

new THREE.BufferAttribute(

bgPos,

3

)

);

const bgMaterial=

new THREE.PointsMaterial({

color:0xffffff,

size:.55,

transparent:true,

opacity:.18,

depthWrite:false,

blending:
THREE.AdditiveBlending

});

const backgroundParticles=

new THREE.Points(

bgGeometry,

bgMaterial

);

scene.add(backgroundParticles);

/*==========================================
        UPDATE PART 1B
==========================================*/

function updatePart1B(time){

const t=time*.001;

clusterGroup.rotation.y+=.00015;

clusterGroup.rotation.x+=.00005;

clusters.forEach(c=>{

c.position.y+=

Math.sin(

t+

c.userData.offset

)*

c.userData.speed*

.08;

c.rotation.x+=.01;

c.rotation.y+=.01;

});

halos.forEach(h=>{

h.rotation.z+=

h.userData.speed;

h.scale.setScalar(

1+

Math.sin(

t*2

)*.08

);

});

floatingLights.forEach((l,i)=>{

l.position.x+=

Math.sin(

t+i

)*.08;

l.position.y+=

Math.cos(

t+i

)*.08;

});

backgroundParticles.rotation.y+=.00004;

backgroundParticles.rotation.x+=.00002;

}
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 2
========================================== */

/*==========================================
        SPIRAL GALAXY
==========================================*/

const galaxyGroup = new THREE.Group();

scene.add(galaxyGroup);

const galaxyGeometry = new THREE.BufferGeometry();

const galaxyCount = 14000;

const galaxyPos = new Float32Array(galaxyCount * 3);

const galaxyColor = new Float32Array(galaxyCount * 3);

for(let i=0;i<galaxyCount;i++){

    const radius = Math.random()*350;

    const branch = i % 5;

    const spin = radius * 0.045;

    const angle =
    (branch/5) * Math.PI*2 + spin;

    const random =
    Math.pow(Math.random(),3)*35;

    const x =
    Math.cos(angle)*
    radius+
    (Math.random()-.5)*random;

    const y =
    (Math.random()-.5)*30;

    const z =
    Math.sin(angle)*
    radius+
    (Math.random()-.5)*random;

    galaxyPos[i*3]=x;
    galaxyPos[i*3+1]=y;
    galaxyPos[i*3+2]=z;

    const c=new THREE.Color(

        palette[
        Math.floor(
        Math.random()*palette.length
        )]

    );

    galaxyColor[i*3]=c.r;
    galaxyColor[i*3+1]=c.g;
    galaxyColor[i*3+2]=c.b;

}

galaxyGeometry.setAttribute(

"position",

new THREE.BufferAttribute(

galaxyPos,

3

)

);

galaxyGeometry.setAttribute(

"color",

new THREE.BufferAttribute(

galaxyColor,

3

)

);

const galaxyMaterial =

new THREE.PointsMaterial({

size:2,

vertexColors:true,

transparent:true,

opacity:.85,

depthWrite:false,

blending:THREE.AdditiveBlending

});

const spiralGalaxy =

new THREE.Points(

galaxyGeometry,

galaxyMaterial

);

galaxyGroup.add(

spiralGalaxy

);

/*==========================================
        RGB NEBULA CLOUDS
==========================================*/

const nebulaGroup =
new THREE.Group();

scene.add(nebulaGroup);

for(let i=0;i<28;i++){

const sprite=new THREE.Sprite(

new THREE.SpriteMaterial({

color:palette[

Math.floor(

Math.random()*palette.length

)

],

transparent:true,

opacity:.08,

blending:

THREE.AdditiveBlending

})

);

const size=

80+

Math.random()*180;

sprite.scale.set(

size,

size,

1

);

sprite.position.set(

(Math.random()-.5)*900,

(Math.random()-.5)*600,

(Math.random()-.5)*800

);

nebulaGroup.add(

sprite

);

}

/*==========================================
        TWINKLING STARS
==========================================*/

const twinkle=[];

stars.geometry.attributes.color.array.forEach(()=>{});

for(let i=0;i<STAR_COUNT;i++){

twinkle.push(

Math.random()*Math.PI*2

);

}

/*==========================================
        SOFT SPACE GLOW
==========================================*/

const glowGeometry=

new THREE.SphereGeometry(

15,

32,

32

);

const glowMaterial=

new THREE.MeshBasicMaterial({

color:0x66ffff,

transparent:true,

opacity:.05

});

const coreGlow=

new THREE.Mesh(

glowGeometry,

glowMaterial

);

scene.add(coreGlow);

/*==========================================
        DEEP SPACE LAYER
==========================================*/

const deepGeometry=

new THREE.BufferGeometry();

const deepPos=

new Float32Array(

5000*3

);

for(let i=0;i<5000;i++){

deepPos[i*3]=

(Math.random()-.5)*5000;

deepPos[i*3+1]=

(Math.random()-.5)*5000;

deepPos[i*3+2]=

(Math.random()-.5)*5000;

}

deepGeometry.setAttribute(

"position",

new THREE.BufferAttribute(

deepPos,

3

)

);

const deepMaterial=

new THREE.PointsMaterial({

color:0x88aaff,

size:.6,

transparent:true,

opacity:.22,

depthWrite:false,

blending:

THREE.AdditiveBlending

});

const deepStars=

new THREE.Points(

deepGeometry,

deepMaterial

);

scene.add(

deepStars

);

/*==========================================
        GALAXY ROTATION SPEED
==========================================*/

let galaxySpeed=.00025;

let nebulaSpeed=.00010;

let glowPulse=0;

/*==========================================
        UPDATE PART 2
==========================================*/

function updatePart2(time){

const t=time*.001;

galaxyGroup.rotation.y+=galaxySpeed;

galaxyGroup.rotation.z+=.00005;

nebulaGroup.rotation.y+=nebulaSpeed;

coreGlow.rotation.y+=.001;

glowPulse+=.02;

coreGlow.scale.setScalar(

1+

Math.sin(glowPulse)*.08

);

deepStars.rotation.y+=.00002;

deepStars.rotation.x+=.00001;

}
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 3
==========================================*/

/*==========================================
        SHOOTING STARS
==========================================*/

const shootingStarGroup=new THREE.Group();
scene.add(shootingStarGroup);

const shootingStars=[];

for(let i=0;i<20;i++){

    const star=new THREE.Mesh(

        new THREE.SphereGeometry(
            .8,
            8,
            8
        ),

        new THREE.MeshBasicMaterial({

            color:0xffffff,

            transparent:true,

            opacity:1

        })

    );

    const tail=new THREE.Mesh(

        new THREE.CylinderGeometry(

            .08,
            .45,
            14,
            6

        ),

        new THREE.MeshBasicMaterial({

            color:0xffffff,

            transparent:true,

            opacity:.30,

            blending:
            THREE.AdditiveBlending

        })

    );

    tail.rotation.z=Math.PI/4;

    star.add(tail);

    resetShootingStar(star);

    shootingStars.push(star);

    shootingStarGroup.add(star);

}

function resetShootingStar(star){

    star.position.set(

        (Math.random()-.5)*2400,

        700+Math.random()*700,

        -1200+Math.random()*1400

    );

    star.userData.speed=

    10+

    Math.random()*12;

}

/*==========================================
        METEOR CLUSTER
==========================================*/

const meteorGroup=new THREE.Group();

scene.add(meteorGroup);

const meteors=[];

for(let i=0;i<35;i++){

    const meteor=new THREE.Mesh(

        new THREE.BoxGeometry(

            1,

            1,

            8+

            Math.random()*10

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.80

        })

    );

    meteor.rotation.z=Math.PI/4;

    meteor.position.set(

        (Math.random()-.5)*2200,

        (Math.random()-.5)*1500,

        (Math.random()-.5)*1500

    );

    meteor.userData.speed=

    3+

    Math.random()*5;

    meteors.push(meteor);

    meteorGroup.add(meteor);

}

/*==========================================
        ENERGY ORBS
==========================================*/

const orbGroup=new THREE.Group();

scene.add(orbGroup);

const energyOrbs=[];

for(let i=0;i<40;i++){

    const orb=new THREE.Mesh(

        new THREE.SphereGeometry(

            4+

            Math.random()*5,

            24,

            24

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.18

        })

    );

    orb.position.set(

        (Math.random()-.5)*1000,

        (Math.random()-.5)*700,

        (Math.random()-.5)*1000

    );

    orb.userData.offset=

    Math.random()*100;

    orbGroup.add(orb);

    energyOrbs.push(orb);

}

/*==========================================
        SPACE FIREFLIES
==========================================*/

const fireflyGroup=new THREE.Group();

scene.add(fireflyGroup);

const fireflies=[];

for(let i=0;i<180;i++){

    const fly=new THREE.Mesh(

        new THREE.SphereGeometry(

            .5,

            8,

            8

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.9

        })

    );

    fly.position.set(

        (Math.random()-.5)*1200,

        (Math.random()-.5)*900,

        (Math.random()-.5)*1200

    );

    fly.userData.offset=

    Math.random()*100;

    fireflies.push(fly);

    fireflyGroup.add(fly);

}

/*==========================================
        STAR TWINKLE
==========================================*/

function animateTwinkle(time){

    const colors=

    stars.geometry.attributes.color.array;

    for(let i=0;i<STAR_COUNT;i++){

        const glow=

        .55+

        Math.sin(

            time*.001+

            twinkle[i]

        )*.45;

        colors[i*3]*=

        .996+

        glow*.004;

        colors[i*3+1]*=

        .996+

        glow*.004;

        colors[i*3+2]*=

        .996+

        glow*.004;

    }

    stars.geometry.attributes.color.needsUpdate=true;

}

/*==========================================
        UPDATE PART 3
==========================================*/

function updatePart3(time){

shootingStars.forEach(star=>{

    star.position.x-=

    star.userData.speed*4;

    star.position.y-=

    star.userData.speed*2;

    if(

        star.position.x<-1500||

        star.position.y<-900

    ){

        resetShootingStar(star);

    }

});

meteors.forEach(m=>{

    m.position.y-=

    m.userData.speed;

    m.position.x+=

    m.userData.speed*.6;

    m.rotation.z+=.01;

    if(m.position.y<-900){

        m.position.y=900;

    }

});

energyOrbs.forEach((orb,i)=>{

    orb.position.y+=

    Math.sin(

        time*.001+

        orb.userData.offset

    )*.25;

    orb.position.x+=

    Math.cos(

        time*.001+

        orb.userData.offset

    )*.18;

    orb.scale.setScalar(

        1+

        Math.sin(

            time*.002+

            i

        )*.22

    );

});

fireflies.forEach((fly,i)=>{

    fly.position.x+=

    Math.sin(

        time*.001+

        fly.userData.offset

    )*.35;

    fly.position.y+=

    Math.cos(

        time*.0015+

        fly.userData.offset

    )*.35;

    fly.position.z+=

    Math.sin(

        time*.0012+

        i

    )*.20;

});

animateTwinkle(time);

}
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 4
==========================================*/

/*==========================================
        FLOATING SPACE CUBES
==========================================*/

const cubeFieldGroup=new THREE.Group();

scene.add(cubeFieldGroup);

const spaceCubes=[];

for(let i=0;i<180;i++){

    const cube=new THREE.Mesh(

        new THREE.BoxGeometry(

            2+

            Math.random()*5,

            2+

            Math.random()*5,

            2+

            Math.random()*5

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            wireframe:true,

            transparent:true,

            opacity:.35

        })

    );

    cube.position.set(

        (Math.random()-.5)*1800,

        (Math.random()-.5)*1200,

        (Math.random()-.5)*1800

    );

    cube.rotation.set(

        Math.random()*Math.PI,

        Math.random()*Math.PI,

        Math.random()*Math.PI

    );

    cube.userData.speed=

    .002+

    Math.random()*.006;

    spaceCubes.push(cube);

    cubeFieldGroup.add(cube);

}

/*==========================================
        COSMIC RINGS
==========================================*/

const cosmicRingGroup=new THREE.Group();

scene.add(cosmicRingGroup);

const cosmicRings=[];

for(let i=0;i<45;i++){

    const ring=new THREE.Mesh(

        new THREE.TorusGeometry(

            12+

            Math.random()*25,

            .4,

            12,

            80

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.12,

            blending:
            THREE.AdditiveBlending

        })

    );

    ring.position.set(

        (Math.random()-.5)*1200,

        (Math.random()-.5)*900,

        (Math.random()-.5)*1200

    );

    ring.rotation.x=Math.PI/2;

    ring.userData.speed=

    .002+

    Math.random()*.004;

    cosmicRings.push(ring);

    cosmicRingGroup.add(ring);

}

/*==========================================
        SPACE CRYSTALS
==========================================*/

const crystalFieldGroup=new THREE.Group();

scene.add(crystalFieldGroup);

const crystals1=[];

for(let i=0;i<90;i++){

    const crystal=new THREE.Mesh(

        new THREE.OctahedronGeometry(

            2+

            Math.random()*4

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            wireframe:true,

            transparent:true,

            opacity:.40

        })

    );

    crystal.position.set(

        (Math.random()-.5)*1600,

        (Math.random()-.5)*900,

        (Math.random()-.5)*1600

    );

    crystal.userData.speed=

    .004+

    Math.random()*.008;

    crystals1.push(crystal);

    crystalFieldGroup.add(crystal);

}

/*==========================================
        ENERGY WAVES
==========================================*/

const waveGroup=new THREE.Group();

scene.add(waveGroup);

const waves=[];

for(let i=0;i<30;i++){

    const wave=new THREE.Mesh(

        new THREE.RingGeometry(

            20,

            22,

            100

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.08,

            side:THREE.DoubleSide,

            blending:
            THREE.AdditiveBlending

        })

    );

    wave.position.set(

        (Math.random()-.5)*900,

        (Math.random()-.5)*700,

        -800+

        Math.random()*500

    );

    wave.userData.scale=

    1+

    Math.random();

    waves.push(wave);

    waveGroup.add(wave);

}

/*==========================================
        UPDATE PART 4
==========================================*/

function updatePart4(time){

const t=time*.001;

cubeFieldGroup.rotation.y+=.0004;

spaceCubes.forEach(c=>{

    c.rotation.x+=c.userData.speed;

    c.rotation.y+=c.userData.speed;

    c.rotation.z+=c.userData.speed*.5;

});

cosmicRings.forEach(r=>{

    r.rotation.z+=r.userData.speed;

    r.scale.setScalar(

        1+

        Math.sin(

            t*2

        )*.05

    );

});

crystals.forEach((c,i)=>{

    c.rotation.x+=c.userData.speed;

    c.rotation.y+=c.userData.speed;

    c.position.y+=

    Math.sin(

        t+i

    )*.08;

});

waves.forEach((w,i)=>{

    w.rotation.z+=.003;

    w.scale.setScalar(

        w.userData.scale+

        Math.sin(

            t*3+i

        )*.12

    );

});

}
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 5
==========================================*/

/*==========================================
        PLANET SYSTEM
==========================================*/

const planetSystemGroup=new THREE.Group();

scene.add(planetSystemGroup);

planetSystemGroup.position.set(
0,
0,
-420
);

const planets=[];

for(let i=0;i<8;i++){

    const planet=new THREE.Mesh(

        new THREE.SphereGeometry(

            8+
            Math.random()*12,

            32,

            32

        ),

        new THREE.MeshStandardMaterial({

            color:randomColor(),

            roughness:.8,

            metalness:.2,

            emissive:0x111111

        })

    );

    planet.userData.radius=

    120+

    i*45+

    Math.random()*20;

    planet.userData.angle=

    Math.random()*Math.PI*2;

    planet.userData.speed=

    .001+

    Math.random()*.003;

    planets.push(planet);

    planetSystemGroup.add(planet);

}

/*==========================================
        ORBITS
==========================================*/

/*==========================================
        COMETS
==========================================*/

const cometGroup=new THREE.Group();

scene.add(cometGroup);

const comets=[];

for(let i=0;i<18;i++){

    const comet=new THREE.Mesh(

        new THREE.ConeGeometry(

            1.2,

            10,

            8

        ),

        new THREE.MeshBasicMaterial({

            color:0xffffff,

            transparent:true,

            opacity:.8

        })

    );

    comet.rotation.z=Math.PI/4;

    comet.position.set(

        (Math.random()-.5)*2200,

        Math.random()*1000,

        -1200+

        Math.random()*1000

    );

    comet.userData.speed=

    5+

    Math.random()*8;

    comets.push(comet);

    cometGroup.add(comet);

}

/*==========================================
        PULSATING STARS
==========================================*/

const pulseStarGroup=new THREE.Group();

scene.add(pulseStarGroup);

const pulseStars=[];

for(let i=0;i<80;i++){

    const star=new THREE.Mesh(

        new THREE.SphereGeometry(

            1+

            Math.random()*2,

            10,

            10

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.8

        })

    );

    star.position.set(

        (Math.random()-.5)*1800,

        (Math.random()-.5)*1200,

        (Math.random()-.5)*1800

    );

    star.userData.offset=

    Math.random()*100;

    pulseStars.push(star);

    pulseStarGroup.add(star);

}

/*==========================================
        UPDATE PART 5
==========================================*/

function updatePart5(time){

const t=time*.001;

planetSystemGroup.rotation.y+=.0002;

planets.forEach(p=>{

    p.userData.angle+=

    p.userData.speed;

    p.position.x=

    Math.cos(

        p.userData.angle

    )*

    p.userData.radius;

    p.position.z=

    Math.sin(

        p.userData.angle

    )*

    p.userData.radius;

    p.rotation.y+=.01;

    p.rotation.x+=.003;

});

comets.forEach(c=>{

    c.position.x-=

    c.userData.speed*2;

    c.position.y-=

    c.userData.speed;

    if(

        c.position.x<-1500||

        c.position.y<-900

    ){

        c.position.set(

            1500,

            900+

            Math.random()*500,

            -1200+

            Math.random()*1000

        );

    }

});

pulseStars.forEach((s,i)=>{

    s.scale.setScalar(

        1+

        Math.sin(

            t*3+

            i

        )*.35

    );

});

}
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 6
==========================================*/

/*==========================================
        NEBULA VORTEX
==========================================*/

const vortexGroup=new THREE.Group();

scene.add(vortexGroup);

const vortexRings=[];

for(let i=0;i<70;i++){

    const ring=new THREE.Mesh(

        new THREE.TorusGeometry(

            20+i*3,

            .5,

            12,

            120

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.08,

            blending:
            THREE.AdditiveBlending

        })

    );

    ring.rotation.x=Math.PI/2;

    ring.userData.speed=

    .001+

    Math.random()*.003;

    vortexRings.push(ring);

    vortexGroup.add(ring);

}

vortexGroup.position.set(

320,

120,

-650

);

/*==========================================
        PLASMA BALLS
==========================================*/

const plasmaGroup=new THREE.Group();

scene.add(plasmaGroup);

const plasmaBalls=[];

for(let i=0;i<45;i++){

    const plasma=new THREE.Mesh(

        new THREE.SphereGeometry(

            2+

            Math.random()*4,

            20,

            20

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.22

        })

    );

    plasma.position.set(

        (Math.random()-.5)*1200,

        (Math.random()-.5)*700,

        (Math.random()-.5)*1200

    );

    plasma.userData.offset=

    Math.random()*100;

    plasmaBalls.push(plasma);

    plasmaGroup.add(plasma);

}

/*==========================================
        SPACE GRID
==========================================*/

const gridGroup=new THREE.Group();

scene.add(gridGroup);

for(let i=0;i<12;i++){

    const grid=new THREE.GridHelper(

        1200,

        30,

        0x44ffff,

        0x224466

    );

    grid.material.transparent=true;

    grid.material.opacity=.04;

    grid.rotation.x=Math.PI/2;

    grid.position.z=

    -150*i;

    gridGroup.add(grid);

}

/*==========================================
        PHOTON PARTICLES
==========================================*/

const photonGeometry=

new THREE.BufferGeometry();

const photonPos=

new Float32Array(

6000*3

);

for(let i=0;i<6000;i++){

    photonPos[i*3]=

    (Math.random()-.5)*2500;

    photonPos[i*3+1]=

    (Math.random()-.5)*2500;

    photonPos[i*3+2]=

    (Math.random()-.5)*2500;

}

photonGeometry.setAttribute(

"position",

new THREE.BufferAttribute(

photonPos,

3

)

);

const photonMaterial=

new THREE.PointsMaterial({

color:0x88ffff,

size:.6,

transparent:true,

opacity:.20,

depthWrite:false,

blending:
THREE.AdditiveBlending

});

const photons=

new THREE.Points(

photonGeometry,

photonMaterial

);

scene.add(photons);

/*==========================================
        SPACE BEACONS
==========================================*/

const beaconGroup=new THREE.Group();

scene.add(beaconGroup);

const beacons=[];

for(let i=0;i<16;i++){

    const beacon=new THREE.PointLight(

        randomColor(),

        1.8,

        180

    );

    beacon.position.set(

        (Math.random()-.5)*1200,

        (Math.random()-.5)*700,

        -900+

        Math.random()*900

    );

    beacon.userData.offset=

    Math.random()*100;

    beacons.push(beacon);

    beaconGroup.add(beacon);

}

/*==========================================
        UPDATE PART 6
==========================================*/

function updatePart6(time){

const t=time*.001;

vortexGroup.rotation.y+=.0008;

vortexRings.forEach((r,i)=>{

    r.rotation.z+=

    r.userData.speed;

    r.scale.setScalar(

        1+

        Math.sin(

            t*2+i

        )*.05

    );

});

plasmaBalls.forEach((p,i)=>{

    p.position.y+=

    Math.sin(

        t+i

    )*.08;

    p.position.x+=

    Math.cos(

        t+i

    )*.05;

    p.rotation.y+=.01;

});

gridGroup.rotation.z+=.00015;

photons.rotation.y+=.00008;

photons.rotation.x+=.00003;

beacons.forEach((b,i)=>{

    b.intensity=

    1.5+

    Math.sin(

        t*4+

        i

    )*.8;

});

}
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 7
========================================== */

/*==========================================
        MILKY WAY GALAXY
==========================================*/

const milkyWayGroup = new THREE.Group();
scene.add(milkyWayGroup);

const milkyGeometry = new THREE.BufferGeometry();

const milkyCount = 18000;

const milkyPos = new Float32Array(milkyCount * 3);
const milkyColor = new Float32Array(milkyCount * 3);

for(let i=0;i<milkyCount;i++){

    const arm = i % 6;

    const radius = Math.random()*850;

    const angle =
    (arm/6)*Math.PI*2+
    radius*0.015;

    const spread =
    Math.random()*40;

    const x =
    Math.cos(angle)*radius+
    (Math.random()-.5)*spread;

    const y =
    (Math.random()-.5)*80;

    const z =
    Math.sin(angle)*radius+
    (Math.random()-.5)*spread;

    milkyPos[i*3]=x;
    milkyPos[i*3+1]=y;
    milkyPos[i*3+2]=z;

    const c=new THREE.Color(
        randomColor()
    );

    milkyColor[i*3]=c.r;
    milkyColor[i*3+1]=c.g;
    milkyColor[i*3+2]=c.b;

}

milkyGeometry.setAttribute(

    "position",

    new THREE.BufferAttribute(
        milkyPos,
        3
    )

);

milkyGeometry.setAttribute(

    "color",

    new THREE.BufferAttribute(
        milkyColor,
        3
    )

);

const milkyMaterial =

new THREE.PointsMaterial({

    size:1.7,

    vertexColors:true,

    transparent:true,

    opacity:.85,

    depthWrite:false,

    blending:
    THREE.AdditiveBlending

});

const milkyWay =

new THREE.Points(

    milkyGeometry,

    milkyMaterial

);

milkyWayGroup.add(milkyWay);

/*==========================================
        BLACK HOLE RING
==========================================*/

const accretionGroup =
new THREE.Group();

scene.add(accretionGroup);

const accretion=[];

for(let i=0;i<45;i++){

    const ring=new THREE.Mesh(

        new THREE.TorusGeometry(

            50+i*3,

            .4,

            10,

            100

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.10,

            blending:
            THREE.AdditiveBlending

        })

    );

    ring.rotation.x=Math.PI/2;

    ring.userData.speed=

    .001+

    Math.random()*.004;

    accretion.push(ring);

    accretionGroup.add(ring);

}

accretionGroup.position.set(
0,
0,
-260
);

/*==========================================
        ENERGY ARCS
==========================================*/

const arcGroup =
new THREE.Group();

scene.add(arcGroup);

const arcs=[];

for(let i=0;i<18;i++){

    const curve=[];

    for(let j=0;j<25;j++){

        curve.push(

            new THREE.Vector3(

                (j-12)*6,

                Math.sin(j)*8,

                Math.cos(j)*10

            )

        );

    }

    const geometry=

    new THREE.BufferGeometry()

    .setFromPoints(curve);

    const line=

    new THREE.Line(

        geometry,

        new THREE.LineBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.35

        })

    );

    line.position.set(

        (Math.random()-.5)*800,

        (Math.random()-.5)*500,

        (Math.random()-.5)*700

    );

    line.userData.offset=

    Math.random()*100;

    arcs.push(line);

    arcGroup.add(line);

}

/*==========================================
        FLOATING CRYSTALS
==========================================*/

const crystalGroup =
new THREE.Group();

scene.add(crystalGroup);

const crystals=[];

for(let i=0;i<55;i++){

    const crystal=

    new THREE.Mesh(

        new THREE.OctahedronGeometry(

            2+

            Math.random()*3

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            wireframe:true,

            transparent:true,

            opacity:.4

        })

    );

    crystal.position.set(

        (Math.random()-.5)*900,

        (Math.random()-.5)*700,

        (Math.random()-.5)*900

    );

    crystal.userData.speed=

    Math.random()*0.01;

    crystals.push(crystal);

    crystalGroup.add(crystal);

}

/*==========================================
        SPACE DUST
==========================================*/

const dustGeometry =
new THREE.BufferGeometry();

const dustPos =
new Float32Array(
18000*3
);

for(let i=0;i<18000;i++){

    dustPos[i*3]=
    (Math.random()-.5)*2500;

    dustPos[i*3+1]=
    (Math.random()-.5)*2500;

    dustPos[i*3+2]=
    (Math.random()-.5)*2500;

}

dustGeometry.setAttribute(

    "position",

    new THREE.BufferAttribute(

        dustPos,

        3

    )

);

const dustMaterial=

new THREE.PointsMaterial({

    color:0xffffff,

    size:.35,

    transparent:true,

    opacity:.18,

    depthWrite:false,

    blending:
    THREE.AdditiveBlending

});

const dust1 =

new THREE.Points(

    dustGeometry,

    dustMaterial

);

scene.add(dust1);

/*==========================================
        UPDATE PART 7
==========================================*/

function updatePart7(time){

    milkyWayGroup.rotation.y+=.00015;

    milkyWayGroup.rotation.z+=.00005;

    accretion.forEach(r=>{

        r.rotation.z+=r.userData.speed;

    });

    arcs.forEach(a=>{

        a.rotation.y+=.01;

        a.rotation.x+=.003;

    });

    crystals.forEach(c=>{

        c.rotation.x+=
        c.userData.speed;

        c.rotation.y+=
        c.userData.speed;

        c.position.y+=

        Math.sin(

            time*.001+

            c.position.x

        )*.05;

    });

    dust.rotation.y+=.0001;

    dust.rotation.x+=.00003;

}

/*==========================================
        PART - 7 END
==========================================*/
/* ==========================================
        COMP PORTAL GALAXY ENGINE V3
              PART - 8
==========================================*/

/*==========================================
        ASTEROID BELT
==========================================*/

const asteroidGroup1 = new THREE.Group();
scene.add(asteroidGroup1);

const asteroids1=[];

for(let i=0;i<450;i++){

    const geo=new THREE.DodecahedronGeometry(

        .6+

        Math.random()*2.5

    );

    const mat=new THREE.MeshStandardMaterial({

        color:palette[

            Math.floor(

                Math.random()*palette.length

            )

        ],

        roughness:1,

        metalness:.15

    });

    const asteroid=new THREE.Mesh(

        geo,

        mat

    );

    const radius=

    420+

    Math.random()*140;

    const angle=

    Math.random()*Math.PI*2;

    asteroid.position.set(

        Math.cos(angle)*radius,

        (Math.random()-.5)*45,

        Math.sin(angle)*radius

    );

    asteroid.userData.angle=angle;

    asteroid.userData.radius=radius;

    asteroid.userData.speed=

    .0008+

    Math.random()*.0015;

    asteroids1.push(asteroid);

    asteroidGroup1.add(asteroid);

}

/*==========================================
        METEOR RAIN
==========================================*/

const meteorRain=[];

for(let i=0;i<80;i++){

    const meteor=new THREE.Mesh(

        new THREE.CylinderGeometry(

            .12,

            .35,

            10,

            6

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.7

        })

    );

    meteor.rotation.z=Math.PI/4;

    meteor.position.set(

        (Math.random()-.5)*1800,

        Math.random()*1200,

        (Math.random()-.5)*1200

    );

    meteor.userData.speed=

    5+

    Math.random()*10;

    meteorRain.push(meteor);

    scene.add(meteor);

}

/*==========================================
        WORMHOLE
==========================================*/

const wormholeGroup=

new THREE.Group();

scene.add(wormholeGroup);

const wormRings=[];

for(let i=0;i<70;i++){

    const ring=new THREE.Mesh(

        new THREE.TorusGeometry(

            25+i*2.4,

            .45,

            12,

            120

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.12,

            blending:
            THREE.AdditiveBlending

        })

    );

    ring.position.z=

    -600+

    i*7;

    wormRings.push(ring);

    wormholeGroup.add(ring);

}

/*==========================================
        PLASMA LIGHTNING
==========================================*/

const lightningGroup=

new THREE.Group();

scene.add(lightningGroup);

const bolts=[];

for(let i=0;i<12;i++){

    const pts=[];

    for(let j=0;j<35;j++){

        pts.push(

            new THREE.Vector3(

                (Math.random()-.5)*18,

                j*6,

                (Math.random()-.5)*18

            )

        );

    }

    const geometry=

    new THREE.BufferGeometry()

    .setFromPoints(pts);

    const line=new THREE.Line(

        geometry,

        new THREE.LineBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.35

        })

    );

    line.position.set(

        (Math.random()-.5)*700,

        (Math.random()-.5)*300,

        (Math.random()-.5)*700

    );

    bolts.push(line);

    lightningGroup.add(line);

}

/*==========================================
        ENERGY TUNNEL
==========================================*/

const tunnelGroup=

new THREE.Group();

scene.add(tunnelGroup);

const tunnel=[];

for(let i=0;i<150;i++){

    const mesh=new THREE.Mesh(

        new THREE.RingGeometry(

            120,

            122,

            120

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.08,

            side:THREE.DoubleSide,

            blending:
            THREE.AdditiveBlending

        })

    );

    mesh.position.z=-i*25;

    tunnel.push(mesh);

    tunnelGroup.add(mesh);

}

/*==========================================
        UPDATE PART 8
==========================================*/
function updatePart8(time){

    asteroidGroup1.rotation.y += .0005;
    asteroidGroup1.rotation.x += .00008;

    asteroids1.forEach(a=>{

        a.userData.angle += a.userData.speed;

        a.position.x =
            Math.cos(a.userData.angle) *
            a.userData.radius;

        a.position.z =
            Math.sin(a.userData.angle) *
            a.userData.radius;

        a.rotation.x += .01;
        a.rotation.y += .01;

    });

    // baaki code same rahega...
}

    meteorRain.forEach(m=>{

        m.position.x-=

        m.userData.speed;

        m.position.y-=

        m.userData.speed*.8;

        if(

            m.position.y<-800

        ){

            m.position.y=700;

            m.position.x=1000;

        }

    });

    wormRings.forEach((r,i)=>{

        r.rotation.z+=

        .004+

        i*.00003;

        r.scale.setScalar(

            1+

            Math.sin(

                time*.002+

                i

            )*.08

        );

    });

    bolts.forEach((b,i)=>{

        b.rotation.y+=.02;

        b.material.opacity=

        .12+

        Math.sin(

            time*.006+

            i

        )*.25;

    });

    tunnel.forEach((t,i)=>{

        t.rotation.z+=.004;

        t.position.z+=2.5;

        if(t.position.z>150){

            t.position.z=-3600;

        }

    });



/*==========================================
        PART - 8 END
==========================================*/
/* ==========================================
        COMP PORTAL GALAXY ENGINE V4
              PART - 9
==========================================*/

/*==========================================
        EARTH
==========================================*/
let earth = null;

planetData.forEach(data => {

    const group = new THREE.Group();

    const mesh = new THREE.Mesh(
        new THREE.SphereGeometry(data.size, 32, 32),
        new THREE.MeshStandardMaterial({
            color: data.color,
            roughness: .8,
            metalness: .15
        })
    );

    group.add(mesh);

    if (data.name === "Earth") {
        earth = mesh;
    }

    solarSystem.add(group);
    planets.push(group);

});

/*==========================================
        CLOUD
==========================================*/

const cloud1=new THREE.Mesh(

new THREE.SphereGeometry(
39.2,
64,
64
),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.18

})

);

earth.add(cloud1);

/*==========================================
        MOON
==========================================*/

const moon1=new THREE.Mesh(

new THREE.SphereGeometry(
12,
32,
32
),

new THREE.MeshStandardMaterial({

color:0xbbbbbb,

roughness:1

})

);

moon1.position.set(

80,
0,
0

);

earthGroup.add(moon1);

/*==========================================
        SATELLITES
==========================================*/

const satellites1=[];

for(let i=0;i<8;i++){

const body=new THREE.Mesh(

new THREE.BoxGeometry(
5,
2,
2
),

new THREE.MeshBasicMaterial({

color:0xffffff

})

);

const panel1=new THREE.Mesh(

new THREE.BoxGeometry(
10,
.5,
4
),

new THREE.MeshBasicMaterial({

color:0x44ccff

})

);

panel1.position.x=-8;

body.add(panel1);

const panel2=panel1.clone();

panel2.position.x=8;

body.add(panel2);

body.userData.angle=

Math.random()*Math.PI*2;

body.userData.radius=

70+

Math.random()*40;

earthGroup.add(body);

satellites1.push(body);

}

/*==========================================
        SPACE SHIPS
==========================================*/

const ships1=[];

for(let i=0;i<5;i++){

const ship=new THREE.Group();

const nose=new THREE.Mesh(

new THREE.ConeGeometry(
2,
8,
8
),

new THREE.MeshBasicMaterial({

color:randomColor()

})

);

nose.rotation.z=Math.PI/2;

ship.add(nose);

const body=new THREE.Mesh(

new THREE.CylinderGeometry(
1.5,
1.5,
10,
8
),

new THREE.MeshBasicMaterial({

color:0xffffff

})

);

body.rotation.z=Math.PI/2;

ship.add(body);

ship.position.set(

-700+

Math.random()*1400,

-300+

Math.random()*600,

-400+

Math.random()*300

);

ship.userData.speed=

2+

Math.random()*3;

scene.add(ship);

ships1.push(ship);

}

/*==========================================
        SUPERNOVA
==========================================*/

const superNova1=new THREE.Mesh(

new THREE.SphereGeometry(
15,
32,
32
),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.35

})

);

superNova1.position.set(

300,
220,
-600

);

scene.add(superNova);

/*==========================================
        ENERGY SPARKS
==========================================*/

const sparks1=[];

for(let i=0;i<250;i++){

const spark=new THREE.Mesh(

new THREE.SphereGeometry(
.5,
8,
8
),

new THREE.MeshBasicMaterial({

color:randomColor()

})

);

spark.position.set(

(Math.random()-.5)*1200,

(Math.random()-.5)*900,

(Math.random()-.5)*1200

);

spark.userData.offset=

Math.random()*100;

scene.add(spark);

sparks1.push(spark);

}

/*==========================================
        GRAVITY LENS
==========================================*/

const gravityLens2=new THREE.Mesh(

new THREE.RingGeometry(

90,

120,

128

),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.08,

side:THREE.DoubleSide,

blending:

THREE.AdditiveBlending

})

);

gravityLens2.rotation.x=Math.PI/2;

gravityLens2.position.set(

0,

0,

-260

);

scene.add(gravityLens2);

/*==========================================
        UPDATE PART 9
==========================================*/

function updatePart9(time){

earth.rotation.y+=.003;

cloud.rotation.y+=.004;

moon.position.x=

Math.cos(time*.0006)*80;

moon.position.z=

Math.sin(time*.0006)*80;

satellites.forEach((s,i)=>{

s.userData.angle+=.008;

s.position.x=

earth.position.x+

Math.cos(

s.userData.angle

)*

s.userData.radius;

s.position.z=

earth.position.z+

Math.sin(

s.userData.angle

)*

s.userData.radius;

s.position.y=

earth.position.y+

Math.sin(

time*.001+i

)*8;

});

ships.forEach(ship=>{

ship.position.x+=

ship.userData.speed;

ship.rotation.z=.2;

if(ship.position.x>800){

ship.position.x=-800;

}

});

superNova.scale.setScalar(

1+

Math.sin(

time*.002

)*.4

);

superNova.material.opacity=

.25+

Math.sin(

time*.002

)*.2;

gravityLens1.rotation.z+=.0015;

gravityLens1.scale.setScalar(

1+

Math.sin(

time*.001

)*.04

);

sparks.forEach((s,i)=>{

s.position.y+=

Math.sin(

time*.001+i

)*.08;

s.position.x+=

Math.cos(

time*.001+i

)*.08;

});

}

/*==========================================
        END PART - 9
==========================================*/
/* ==========================================
        COMP PORTAL GALAXY ENGINE V4
              PART - 9
==========================================*/

/*==========================================
        EARTH
==========================================*/

const earthGroup=new THREE.Group();

scene.add(earthGroup);

const earth1=new THREE.Mesh(

new THREE.SphereGeometry(
38,
64,
64
),

new THREE.MeshPhongMaterial({

color:0x2f7fff,

emissive:0x001133,

shininess:100

})

);

earth1.position.set(

-420,
180,
-500

);

earthGroup.add(earth);

/*==========================================
        CLOUD
==========================================*/

const cloud=new THREE.Mesh(

new THREE.SphereGeometry(
39.2,
64,
64
),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.18

})

);

earth1.add(cloud);

/*==========================================
        MOON
==========================================*/

const moon=new THREE.Mesh(

new THREE.SphereGeometry(
12,
32,
32
),

new THREE.MeshStandardMaterial({

color:0xbbbbbb,

roughness:1

})

);

moon.position.set(

80,
0,
0

);

earthGroup.add(moon);

/*==========================================
        SATELLITES
==========================================*/

const satellites=[];

for(let i=0;i<8;i++){

const body=new THREE.Mesh(

new THREE.BoxGeometry(
5,
2,
2
),

new THREE.MeshBasicMaterial({

color:0xffffff

})

);

const panel1=new THREE.Mesh(

new THREE.BoxGeometry(
10,
.5,
4
),

new THREE.MeshBasicMaterial({

color:0x44ccff

})

);

panel1.position.x=-8;

body.add(panel1);

const panel2=panel1.clone();

panel2.position.x=8;

body.add(panel2);

body.userData.angle=

Math.random()*Math.PI*2;

body.userData.radius=

70+

Math.random()*40;

earthGroup.add(body);

satellites.push(body);

}

/*==========================================
        SPACE SHIPS
==========================================*/

const ships=[];

for(let i=0;i<5;i++){

const ship=new THREE.Group();

const nose=new THREE.Mesh(

new THREE.ConeGeometry(
2,
8,
8
),

new THREE.MeshBasicMaterial({

color:randomColor()

})

);

nose.rotation.z=Math.PI/2;

ship.add(nose);

const body=new THREE.Mesh(

new THREE.CylinderGeometry(
1.5,
1.5,
10,
8
),

new THREE.MeshBasicMaterial({

color:0xffffff

})

);

body.rotation.z=Math.PI/2;

ship.add(body);

ship.position.set(

-700+

Math.random()*1400,

-300+

Math.random()*600,

-400+

Math.random()*300

);

ship.userData.speed=

2+

Math.random()*3;

scene.add(ship);

ships.push(ship);

}

/*==========================================
        SUPERNOVA
==========================================*/

const superNova=new THREE.Mesh(

new THREE.SphereGeometry(
15,
32,
32
),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.35

})

);

superNova.position.set(

300,
220,
-600

);

scene.add(superNova);

/*==========================================
        ENERGY SPARKS
==========================================*/

const sparks=[];

for(let i=0;i<250;i++){

const spark=new THREE.Mesh(

new THREE.SphereGeometry(
.5,
8,
8
),

new THREE.MeshBasicMaterial({

color:randomColor()

})

);

spark.position.set(

(Math.random()-.5)*1200,

(Math.random()-.5)*900,

(Math.random()-.5)*1200

);

spark.userData.offset=

Math.random()*100;

scene.add(spark);

sparks.push(spark);

}

/*==========================================
        GRAVITY LENS
==========================================*/

const gravityLens1=new THREE.Mesh(

new THREE.RingGeometry(

90,

120,

128

),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.08,

side:THREE.DoubleSide,

blending:

THREE.AdditiveBlending

})

);

gravityLens1.rotation.x=Math.PI/2;

gravityLens1.position.set(

0,

0,

-260

);

scene.add(gravityLens1);

/*==========================================
        UPDATE PART 9
==========================================*/

function updatePart9(time){

earth1.rotation.y+=.003;

cloud.rotation.y+=.004;

moon.position.x=

Math.cos(time*.0006)*80;

moon.position.z=

Math.sin(time*.0006)*80;

satellites.forEach((s,i)=>{

s.userData.angle+=.008;

s.position.x=

earth1.position.x+

Math.cos(

s.userData.angle

)*

s.userData.radius;

s.position.z=

earth1.position.z+

Math.sin(

s.userData.angle

)*

s.userData.radius;

s.position.y=

earth1.position.y+

Math.sin(

time*.001+i

)*8;

});

ships.forEach(ship=>{

ship.position.x+=

ship.userData.speed;

ship.rotation.z=.2;

if(ship.position.x>800){

ship.position.x=-800;

}

});

superNova.scale.setScalar(

1+

Math.sin(

time*.002

)*.4

);

superNova.material.opacity=

.25+

Math.sin(

time*.002

)*.2;

gravityLens1.rotation.z+=.0015;

gravityLens1.scale.setScalar(

1+

Math.sin(

time*.001

)*.04

);

sparks.forEach((s,i)=>{

s.position.y+=

Math.sin(

time*.001+i

)*.08;

s.position.x+=

Math.cos(

time*.001+i

)*.08;

});

}

/*==========================================
        END PART - 9
==========================================*/
/* ==========================================
        COMP PORTAL GALAXY ENGINE V4
              PART - 10
==========================================*/

/*==========================================
        HYPER SPACE STREAKS
==========================================*/

const warpGroup=new THREE.Group();

scene.add(warpGroup);

const warpLines=[];

for(let i=0;i<900;i++){

    const geo=new THREE.CylinderGeometry(

        .05,
        .05,
        15+Math.random()*35,
        6

    );

    const mat=new THREE.MeshBasicMaterial({

        color:randomColor(),

        transparent:true,

        opacity:.35,

        blending:THREE.AdditiveBlending

    });

    const line=new THREE.Mesh(
        geo,
        mat
    );

    line.rotation.x=Math.PI/2;

    line.position.set(

        (Math.random()-.5)*2200,

        (Math.random()-.5)*2200,

        -2500+Math.random()*2500

    );

    line.userData.speed=

    10+

    Math.random()*25;

    warpLines.push(line);

    warpGroup.add(line);

}

/*==========================================
        BLACK HOLE GRAVITY RINGS
==========================================*/

const gravityGroup=new THREE.Group();

scene.add(gravityGroup);

const gravityRings=[];

for(let i=0;i<80;i++){

    const ring=new THREE.Mesh(

        new THREE.TorusGeometry(

            80+i*4,

            .5,

            12,

            180

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.12,

            blending:
            THREE.AdditiveBlending

        })

    );

    ring.rotation.x=Math.PI/2;

    ring.userData.speed=

    .0008+

    Math.random()*.002;

    gravityRings.push(ring);

    gravityGroup.add(ring);

}

gravityGroup.position.set(
0,
0,
-380
);

/*==========================================
        ASTEROID EXPLOSION
==========================================*/

const explosionGroup=new THREE.Group();

scene.add(explosionGroup);

const explosion=[];

for(let i=0;i<700;i++){

    const rock=new THREE.Mesh(

        new THREE.IcosahedronGeometry(

            .3+

            Math.random()*1.2

        ),

        new THREE.MeshBasicMaterial({

            color:randomColor()

        })

    );

    rock.position.set(0,0,-350);

    rock.userData.vx=

    (Math.random()-.5)*8;

    rock.userData.vy=

    (Math.random()-.5)*8;

    rock.userData.vz=

    (Math.random()-.5)*8;

    explosion.push(rock);

    explosionGroup.add(rock);

}

/*==========================================
        PULSAR STAR
==========================================*/

const pulsar=new THREE.Mesh(

new THREE.SphereGeometry(
8,
32,
32
),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.8

})

);

pulsar.position.set(
-320,
180,
-600
);

scene.add(pulsar);

/*==========================================
        PULSAR BEAMS
==========================================*/

const beam1=new THREE.Mesh(

new THREE.CylinderGeometry(
1,
1,
250,
12
),

new THREE.MeshBasicMaterial({

color:0x66ffff,

transparent:true,

opacity:.25

})

);

beam1.rotation.z=Math.PI/2;

pulsar.add(beam1);

const beam2=beam1.clone();

beam2.rotation.x=Math.PI/2;

pulsar.add(beam2);

/*==========================================
        HYPER STARS
==========================================*/

const hyperStars=[];

for(let i=0;i<350;i++){

const star=new THREE.Mesh(

new THREE.SphereGeometry(
.5,
8,
8
),

new THREE.MeshBasicMaterial({

color:randomColor()

})

);

star.position.set(

(Math.random()-.5)*1800,

(Math.random()-.5)*1800,

-2500+Math.random()*2500

);

star.userData.speed=

6+

Math.random()*12;

scene.add(star);

hyperStars.push(star);

}

/*==========================================
        UPDATE PART 10
==========================================*/

function updatePart10(time){

    warpLines.forEach(line=>{

        line.position.z+=line.userData.speed;

        if(line.position.z>300){

            line.position.z=-2500;

        }

    });

    gravityRings.forEach(r=>{

        r.rotation.z+=r.userData.speed;

        r.scale.setScalar(

            1+

            Math.sin(

                time*.001

            )*.03

        );

    });

    explosion.forEach(e=>{

        e.position.x+=e.userData.vx*.05;

        e.position.y+=e.userData.vy*.05;

        e.position.z+=e.userData.vz*.05;

    });

    pulsar.scale.setScalar(

        1+

        Math.sin(

            time*.005

        )*.25

    );

    beam1.rotation.y+=.02;

    beam2.rotation.z+=.02;

    hyperStars.forEach(s=>{

        s.position.z+=s.userData.speed;

        if(s.position.z>300){

            s.position.z=-2500;

        }

    });

}

/*==========================================
        END PART - 10
==========================================*/
/* ==========================================
        COMP PORTAL GALAXY ENGINE V5
              PART - 11A
==========================================*/

/*==========================================
        SOLAR SYSTEM
==========================================*/

const solarSystem=new THREE.Group();

scene.add(solarSystem);

solarSystem.position.set(
850,
-180,
-950
);

/*==========================================
        SUN
==========================================*/

const sunGroup1=new THREE.Group();

solarSystem.add(sunGroup1);

const sun1=new THREE.Mesh(

new THREE.SphereGeometry(
55,
64,
64
),

new THREE.MeshBasicMaterial({

color:0xffcc22

})

);

sunGroup1.add(sun1);

/*==========================================
        SUN GLOW
==========================================*/

const sunGlow1=new THREE.Mesh(

new THREE.SphereGeometry(
72,
64,
64
),

new THREE.MeshBasicMaterial({

color:0xffaa00,

transparent:true,

opacity:.18,

blending:THREE.AdditiveBlending

})

);

sunGroup.add(sunGlow1);

/*==========================================
        SOLAR CORONA
==========================================*/

const corona=[];

for(let i=0;i<90;i++){

const beam=new THREE.Mesh(

new THREE.CylinderGeometry(

.5,
.5,
90,
8

),

new THREE.MeshBasicMaterial({

color:0xffee66,

transparent:true,

opacity:.18

})

);

beam.rotation.z=
Math.random()*Math.PI;

beam.rotation.y=
Math.random()*Math.PI;

beam.userData.offset=
Math.random()*100;

sunGroup.add(beam);

corona.push(beam);

}

/*==========================================
        PLANET DATA
==========================================*/

const planetData=[

{
name:"Mercury",
radius:90,
size:6,
color:0xbcbcbc,
speed:.016
},

{
name:"Venus",
radius:125,
size:10,
color:0xe9c46a,
speed:.013
},

{
name:"Earth",
radius:170,
size:11,
color:0x3b82f6,
speed:.010
},

{
name:"Mars",
radius:220,
size:9,
color:0xd9480f,
speed:.008
},

{
name:"Jupiter",
radius:300,
size:26,
color:0xd6a77a,
speed:.006
},

{
name:"Saturn",
radius:390,
size:22,
color:0xf4d35e,
speed:.005
},

{
name:"Uranus",
radius:470,
size:17,
color:0x79d9ff,
speed:.004
},

{
name:"Neptune",
radius:560,
size:17,
color:0x295cff,
speed:.003

}

];

const planets1=[];

/*==========================================
        CREATE PLANETS
==========================================*/

planetData.forEach(data=>{

const group=new THREE.Group();

const mesh=new THREE.Mesh(

new THREE.SphereGeometry(

data.size,

32,

32

),

new THREE.MeshStandardMaterial({

color:data.color,

roughness:.8,

metalness:.15

})

);

group.add(mesh);

/* Orbit */

const orbit=new THREE.Mesh(

new THREE.RingGeometry(

data.radius-.4,

data.radius+.4,

180

),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.08,

side:THREE.DoubleSide

})

);

orbit.rotation.x=Math.PI/2;

solarSystem.add(orbit);

/* Saturn Ring */

if(data.name==="Saturn"){

const ring=new THREE.Mesh(

new THREE.RingGeometry(

30,

45,

120

),

new THREE.MeshBasicMaterial({

color:0xffdd88,

transparent:true,

opacity:.30,

side:THREE.DoubleSide

})

);

ring.rotation.x=Math.PI/2.4;

mesh.add(ring);

}

group.userData={

angle:Math.random()*Math.PI*2,

radius:data.radius,

speed:data.speed

};

solarSystem.add(group);

planets1.push(group);

});

/*==========================================
        SOLAR LIGHT
==========================================*/

const sunLight=new THREE.PointLight(

0xffddaa,

4,

3000

);

solarSystem.add(sunLight);

/*==========================================
        UPDATE PART 11A
==========================================*/

function updatePart11A(time){

sun.rotation.y+=.003;

sunGlow.rotation.y+=.001;

sunGlow.scale.setScalar(

1+

Math.sin(

time*.002

)*.06

);

corona.forEach((c,i)=>{

c.rotation.z+=.01;

c.scale.y=

1+

Math.sin(

time*.003+

i

)*.25;

});

planets.forEach(p=>{

p.userData.angle+=

p.userData.speed;

p.position.x=

Math.cos(

p.userData.angle

)*

p.userData.radius;

p.position.z=

Math.sin(

p.userData.angle

)*

p.userData.radius;

p.rotation.y+=.02;

});

solarSystem.rotation.y+=.0006;

}

/*==========================================
        END PART 11A
==========================================*/
/* ==========================================
        COMP PORTAL GALAXY ENGINE V5
              PART - 11B
==========================================*/

/*==========================================
        SPACE STATION
==========================================*/

const stationGroup=new THREE.Group();

scene.add(stationGroup);

stationGroup.position.set(
-650,
220,
-700
);

const stationCore=new THREE.Mesh(

new THREE.CylinderGeometry(
12,
12,
60,
32
),

new THREE.MeshStandardMaterial({

color:0xcfd8dc,

metalness:.8,

roughness:.25

})

);

stationCore.rotation.z=Math.PI/2;

stationGroup.add(stationCore);

/*==========================================
        STATION RINGS
==========================================*/

const stationRings=[];

for(let i=0;i<4;i++){

const ring=new THREE.Mesh(

new THREE.TorusGeometry(

25+i*8,

1.5,

20,

120

),

new THREE.MeshBasicMaterial({

color:randomColor(),

transparent:true,

opacity:.35

})

);

ring.rotation.y=Math.PI/2;

ring.userData.speed=.003+i*.001;

stationGroup.add(ring);

stationRings.push(ring);

}

/*==========================================
        SOLAR PANELS
==========================================*/

for(let i=-1;i<=1;i+=2){

const panel=new THREE.Mesh(

new THREE.BoxGeometry(

55,

1,

18

),

new THREE.MeshBasicMaterial({

color:0x44bbff

})

);

panel.position.x=i*48;

stationGroup.add(panel);

}

/*==========================================
        UFO FLEET
==========================================*/

const ufoFleet=[];

for(let i=0;i<10;i++){

const ufo=new THREE.Group();

const body=new THREE.Mesh(

new THREE.SphereGeometry(
6,
24,
24
),

new THREE.MeshPhongMaterial({

color:0xaaaaaa,

shininess:100

})

);

body.scale.y=.35;

ufo.add(body);

const dome=new THREE.Mesh(

new THREE.SphereGeometry(
3,
18,
18
),

new THREE.MeshBasicMaterial({

color:0x55ffff,

transparent:true,

opacity:.6

})

);

dome.position.y=2;

ufo.add(dome);

ufo.position.set(

(Math.random()-.5)*1400,

Math.random()*450-200,

-800+Math.random()*500

);

ufo.userData.speed=

1+

Math.random()*2;

ufo.userData.offset=

Math.random()*100;

scene.add(ufo);

ufoFleet.push(ufo);

}

/*==========================================
        ASTEROID BELT
==========================================*/

const beltGroup=new THREE.Group();

scene.add(beltGroup);

const belt=[];

for(let i=0;i<900;i++){

const rock=new THREE.Mesh(

new THREE.DodecahedronGeometry(

.4+

Math.random()*1.8

),

new THREE.MeshStandardMaterial({

color:0x888888,

roughness:1

})

);

const r=

650+

Math.random()*90;

const a=

Math.random()*Math.PI*2;

rock.position.set(

Math.cos(a)*r,

(Math.random()-.5)*25,

Math.sin(a)*r

);

rock.userData.angle=a;

rock.userData.radius=r;

rock.userData.speed=

.0008+

Math.random()*.0015;

beltGroup.add(rock);

belt.push(rock);

}

/*==========================================
        MOONS
==========================================*/

const moons=[];

planets.forEach((planet,index)=>{

if(index<2) return;

const moon=new THREE.Mesh(

new THREE.SphereGeometry(

2+Math.random()*2,

16,

16

),

new THREE.MeshBasicMaterial({

color:0xffffff

})

);

moon.userData.parent=planet;

moon.userData.radius=

18+

Math.random()*12;

moon.userData.angle=

Math.random()*Math.PI*2;

moon.userData.speed=

.02+

Math.random()*.02;

scene.add(moon);

moons.push(moon);

});

/*==========================================
        SPACE SHUTTLE
==========================================*/

const shuttle=new THREE.Group();

scene.add(shuttle);

const shuttleBody=new THREE.Mesh(

new THREE.CylinderGeometry(

2,

2,

22,

16

),

new THREE.MeshStandardMaterial({

color:0xffffff

})

);

shuttleBody.rotation.z=Math.PI/2;

shuttle.add(shuttleBody);

const nose=new THREE.Mesh(

new THREE.ConeGeometry(

2,

6,

16

),

new THREE.MeshStandardMaterial({

color:0xff4444

})

);

nose.rotation.z=-Math.PI/2;

nose.position.x=14;

shuttle.add(nose);

shuttle.position.set(

-900,

-180,

-500

);

/*==========================================
        UPDATE PART 11B
==========================================*/

function updatePart11B(time){

stationGroup.rotation.y+=.002;

stationRings.forEach(r=>{

r.rotation.z+=r.userData.speed;

});

ufoFleet.forEach((u,i)=>{

u.position.x+=u.userData.speed;

u.position.y+=

Math.sin(

time*.001+

u.userData.offset

)*.6;

u.rotation.y+=.02;

if(u.position.x>900){

u.position.x=-900;

}

});

belt.forEach(b=>{

b.userData.angle+=b.userData.speed;

b.position.x=

Math.cos(

b.userData.angle

)*

b.userData.radius;

b.position.z=

Math.sin(

b.userData.angle

)*

b.userData.radius;

b.rotation.x+=.01;

b.rotation.y+=.01;

});

moons.forEach(m=>{

m.userData.angle+=

m.userData.speed;

const p=

m.userData.parent.position;

m.position.x=

solarSystem.position.x+

p.x+

Math.cos(

m.userData.angle

)*

m.userData.radius;

m.position.y=

solarSystem.position.y;

m.position.z=

solarSystem.position.z+

p.z+

Math.sin(

m.userData.angle

)*

m.userData.radius;

});

shuttle.position.x+=2;

shuttle.position.y+=

Math.sin(

time*.002

)*.8;

if(shuttle.position.x>900){

shuttle.position.x=-900;

}

shuttle.rotation.z=.05;

}

/*==========================================
        END PART - 11B
==========================================*/
/* ==========================================
        COMP PORTAL GALAXY ENGINE V5
              PART - 12
==========================================*/

/*==========================================
        RGB SUN
==========================================*/

const sunGroup=new THREE.Group();

scene.add(sunGroup);

const sun=new THREE.Mesh(

new THREE.SphereGeometry(
45,
64,
64
),

new THREE.MeshBasicMaterial({

color:0xffcc33

})

);

sun.position.set(
-420,
180,
-520
);

sunGroup.add(sun);

/*==========================================
        SUN GLOW
==========================================*/

const sunGlow=new THREE.Mesh(

new THREE.SphereGeometry(
75,
64,
64
),

new THREE.MeshBasicMaterial({

color:0xff8844,

transparent:true,

opacity:.18,

blending:THREE.AdditiveBlending

})

);

sun.add(sunGlow);

/*==========================================
        GOD RAYS
==========================================*/

const rayGroup=new THREE.Group();

scene.add(rayGroup);

const rays=[];

for(let i=0;i<70;i++){

const geo=new THREE.PlaneGeometry(
3,
320
);

const mat=new THREE.MeshBasicMaterial({

color:0xffdd88,

transparent:true,

opacity:.05,

side:THREE.DoubleSide,

blending:THREE.AdditiveBlending

});

const ray=new THREE.Mesh(
geo,
mat
);

ray.position.copy(
sun.position
);

ray.rotation.z=
Math.random()*Math.PI*2;

ray.userData.speed=
0.0004+
Math.random()*0.0008;

rays.push(ray);

rayGroup.add(ray);

}

/*==========================================
        SUPERNOVA
==========================================*/

const nova=new THREE.Mesh(

new THREE.IcosahedronGeometry(
25,
5
),

new THREE.MeshBasicMaterial({

color:0xffffff,

wireframe:true,

transparent:true,

opacity:.30

})

);

nova.position.set(
250,
140,
-300
);

scene.add(nova);

/*==========================================
        ENERGY BALL
==========================================*/

const energyBall=new THREE.Mesh(

new THREE.SphereGeometry(
18,
32,
32
),

new THREE.MeshBasicMaterial({

color:0x00ffff,

transparent:true,

opacity:.25

})

);

energyBall.position.set(
-120,
-120,
-220
);

scene.add(energyBall);

/*==========================================
        COSMIC DUST
==========================================*/

const dustGroup=new THREE.Group();

scene.add(dustGroup);

const dust=[];

for(let i=0;i<300;i++){

const d=new THREE.Mesh(

new THREE.SphereGeometry(
0.8,
6,
6
),

new THREE.MeshBasicMaterial({

color:randomColor(),

transparent:true,

opacity:.7

})

);

d.position.set(

(Math.random()-.5)*900,

(Math.random()-.5)*600,

(Math.random()-.5)*900

);

d.userData.offset=
Math.random()*100;

dust.push(d);

dustGroup.add(d);

}

/*==========================================
        UPDATE PART-12
==========================================*/

function updatePart12(time){

const t=time*0.001;

/* SUN */

sun.rotation.y+=0.002;

sun.material.color.setHSL(

(t*.05)%1,

1,

.55

);

sunGlow.scale.setScalar(

1+

Math.sin(t*2)*0.12

);

/* GOD RAYS */

rays.forEach(ray=>{

ray.rotation.z+=

ray.userData.speed;

});

/* NOVA */

nova.rotation.x+=0.004;

nova.rotation.y+=0.005;

nova.scale.setScalar(

1+

Math.sin(t*3)*0.20

);

nova.material.color.setHSL(

(t*.12)%1,

1,

.7

);

/* ENERGY BALL */

energyBall.rotation.y+=0.01;

energyBall.rotation.x+=0.005;

energyBall.scale.setScalar(

1+

Math.sin(t*4)*0.18

);

energyBall.material.color.setHSL(

(t*.15)%1,

1,

.6

);

/* COSMIC DUST */

dust.forEach((d,i)=>{

d.position.x+=

Math.sin(

t+i

)*0.15;

d.position.y+=

Math.cos(

t+i

)*0.12;

});

dustGroup.rotation.y+=0.0006;

}

/*==========================================
        END PART - 12
==========================================*/
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 13
==========================================*/

/*==========================================
        ASTEROID BELT
==========================================*/

const asteroidGroup = new THREE.Group();
scene.add(asteroidGroup);

const asteroids = [];

for(let i=0;i<450;i++){

    const rock = new THREE.Mesh(

        new THREE.DodecahedronGeometry(
            0.5 + Math.random()*2
        ),

        new THREE.MeshStandardMaterial({

            color:0x777777,

            roughness:1,

            metalness:.2

        })

    );

    const angle=Math.random()*Math.PI*2;
    const radius=250+Math.random()*150;

    rock.position.set(

        Math.cos(angle)*radius,
        (Math.random()-.5)*30,
        Math.sin(angle)*radius-250

    );

    rock.userData.angle=angle;
    rock.userData.radius=radius;
    rock.userData.speed=.0005+Math.random()*.001;

    asteroidGroup.add(rock);
    asteroids.push(rock);

}

/*==========================================
        ENERGY BEAMS
==========================================*/

const beamGroup=new THREE.Group();
scene.add(beamGroup);

const beams=[];

for(let i=0;i<18;i++){

    const beam=new THREE.Mesh(

        new THREE.CylinderGeometry(
            .8,.8,420,10
        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            transparent:true,

            opacity:.12,

            blending:THREE.AdditiveBlending

        })

    );

    beam.position.set(

        (Math.random()-.5)*700,

        0,

        -450+Math.random()*250

    );

    beam.rotation.z=Math.random()*Math.PI;

    beam.userData.offset=Math.random()*100;

    beamGroup.add(beam);

    beams.push(beam);

}

/*==========================================
        DIAMOND STARS
==========================================*/

const diamondGroup=new THREE.Group();
scene.add(diamondGroup);

const diamonds=[];

for(let i=0;i<160;i++){

    const diamond=new THREE.Mesh(

        new THREE.OctahedronGeometry(
            1+Math.random()*2
        ),

        new THREE.MeshBasicMaterial({

            color:randomColor(),

            wireframe:true,

            transparent:true,

            opacity:.45

        })

    );

    diamond.position.set(

        (Math.random()-.5)*1500,

        (Math.random()-.5)*900,

        (Math.random()-.5)*1500

    );

    diamond.userData.speed=

    .003+

    Math.random()*.005;

    diamondGroup.add(diamond);

    diamonds.push(diamond);

}

/*==========================================
        GALAXY COLLISION LIGHTS
==========================================*/

const collisionGroup=new THREE.Group();
scene.add(collisionGroup);

const collisionA=new THREE.PointLight(

0x00ffff,

4,

500

);

collisionA.position.set(
-160,
40,
-300
);

collisionGroup.add(collisionA);

const collisionB=new THREE.PointLight(

0xff00ff,

4,

500

);

collisionB.position.set(
160,
-40,
-300
);

collisionGroup.add(collisionB);

/*==========================================
        LENS FLARE
==========================================*/

const flare=new THREE.Mesh(

new THREE.PlaneGeometry(
35,
35
),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.18,

blending:
THREE.AdditiveBlending

})

);

flare.position.set(
0,
0,
-200
);

scene.add(flare);

/*==========================================
        COLLISION CORE
==========================================*/

const collisionCore=new THREE.Mesh(

new THREE.SphereGeometry(
12,
32,
32
),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.4

})

);

collisionCore.position.set(
0,
0,
-300
);

scene.add(collisionCore);

/*==========================================
        ENERGY RINGS
==========================================*/

const collisionRings=[];

for(let i=0;i<12;i++){

const ring=new THREE.Mesh(

new THREE.TorusGeometry(

25+i*10,

.5,

16,

120

),

new THREE.MeshBasicMaterial({

color:randomColor(),

transparent:true,

opacity:.12,

blending:
THREE.AdditiveBlending

})

);

ring.rotation.x=Math.PI/2;

ring.position.z=-300;

scene.add(ring);

collisionRings.push(ring);

}

/*==========================================
        UPDATE PART 13
==========================================*/

function updatePart13(time){

const t=time*.001;

/* ASTEROIDS */

asteroids.forEach(a=>{

a.userData.angle+=a.userData.speed;

a.position.x=

Math.cos(a.userData.angle)*

a.userData.radius;

a.position.z=

Math.sin(a.userData.angle)*

a.userData.radius-250;

a.rotation.x+=.01;

a.rotation.y+=.008;

});

/* ENERGY BEAMS */

beams.forEach((b,i)=>{

b.scale.y=

1+

Math.sin(t*2+i)*.4;

b.material.opacity=

.05+

Math.sin(t*3+i)*.08;

});

/* DIAMONDS */

diamonds.forEach(d=>{

d.rotation.x+=d.userData.speed;

d.rotation.y+=d.userData.speed;

});

/* COLLISION */

collisionA.position.x=

Math.sin(t*.4)*170;

collisionB.position.x=

-Math.sin(t*.4)*170;

collisionA.intensity=

3+

Math.sin(t*4);

collisionB.intensity=

3+

Math.cos(t*4);

collisionCore.scale.setScalar(

1+

Math.sin(t*5)*.25

);

/* FLARE */

flare.rotation.z+=.002;

flare.scale.setScalar(

1+

Math.sin(t*4)*.20

);

/* RINGS */

collisionRings.forEach((r,i)=>{

r.rotation.z+=.003+i*.0003;

r.scale.setScalar(

1+

Math.sin(t*2+i)*.08

);

});

}
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 14
==========================================*/

/*==========================================
        ALIEN MOTHERSHIP
==========================================*/

const mothershipGroup=new THREE.Group();
scene.add(mothershipGroup);

const mothershipBody=new THREE.Mesh(

new THREE.CylinderGeometry(
35,
70,
18,
64
),

new THREE.MeshStandardMaterial({

color:0x6fdcff,

emissive:0x114466,

roughness:.45,

metalness:.9

})

);

mothershipGroup.add(mothershipBody);

const mothershipDome=new THREE.Mesh(

new THREE.SphereGeometry(
18,
32,
32
),

new THREE.MeshPhysicalMaterial({

color:0x66ffff,

transparent:true,

opacity:.45,

transmission:.9

})

);

mothershipDome.position.y=10;

mothershipGroup.add(mothershipDome);

mothershipGroup.position.set(
0,
220,
-650
);

/*==========================================
        ENGINE LIGHTS
==========================================*/

const engineLights=[];

for(let i=0;i<8;i++){

const light=new THREE.PointLight(

randomColor(),

2,

140

);

light.position.set(

-28+i*8,

-8,

0

);

mothershipGroup.add(light);

engineLights.push(light);

}

/*==========================================
        DRONE SWARM
==========================================*/

const droneGroup=new THREE.Group();

scene.add(droneGroup);

const drones=[];

for(let i=0;i<80;i++){

const drone=new THREE.Mesh(

new THREE.SphereGeometry(
1.4,
12,
12
),

new THREE.MeshBasicMaterial({

color:randomColor()

})

);

drone.position.set(

(Math.random()-.5)*700,

150+Math.random()*200,

-500+Math.random()*300

);

drone.userData.angle=Math.random()*Math.PI*2;

drone.userData.radius=20+Math.random()*80;

drone.userData.speed=.01+Math.random()*.02;

droneGroup.add(drone);

drones.push(drone);

}

/*==========================================
        METEOR STORM
==========================================*/

const meteorStorm=[];

for(let i=0;i<140;i++){

const meteor=new THREE.Mesh(

new THREE.BoxGeometry(

.4,

.4,

7

),

new THREE.MeshBasicMaterial({

color:0xffffff,

transparent:true,

opacity:.7

})

);

meteor.position.set(

(Math.random()-.5)*2200,

900+Math.random()*1200,

(Math.random()-.5)*1400

);

meteor.userData.speed=

8+

Math.random()*8;

scene.add(meteor);

meteorStorm.push(meteor);

}

/*==========================================
        MILKY WAY CORE
==========================================*/

const milkyWayCore=new THREE.Group();

scene.add(milkyWayCore);

const spiral=[];

for(let i=0;i<700;i++){

const star=new THREE.Mesh(

new THREE.SphereGeometry(
0.5,
6,
6
),

new THREE.MeshBasicMaterial({

color:randomColor()

})

);

spiral.push(star);

milkyWayCore.add(star);

}

/*==========================================
        PORTAL CORE
==========================================*/

const portalCore=new THREE.Mesh(

new THREE.SphereGeometry(
22,
32,
32
),

new THREE.MeshBasicMaterial({

color:0x66ffff,

transparent:true,

opacity:.28

})

);

portalCore.position.set(
0,
0,
-720
);

scene.add(portalCore);

/*==========================================
        PORTAL RINGS
==========================================*/

const portalRings=[];

for(let i=0;i<18;i++){

const ring=new THREE.Mesh(

new THREE.TorusGeometry(

40+i*8,

0.6,

16,

140

),

new THREE.MeshBasicMaterial({

color:randomColor(),

transparent:true,

opacity:.10,

blending:
THREE.AdditiveBlending

})

);

ring.rotation.x=Math.PI/2;

ring.position.copy(portalCore.position);

scene.add(ring);

portalRings.push(ring);

}

/*==========================================
        SPACE ENERGY PARTICLES
==========================================*/

const energyParticles=[];

for(let i=0;i<250;i++){

const particle=new THREE.Mesh(

new THREE.SphereGeometry(
0.4,
6,
6
),

new THREE.MeshBasicMaterial({

color:randomColor()

})

);

particle.position.set(

(Math.random()-.5)*900,

(Math.random()-.5)*600,

-900+Math.random()*600

);

particle.userData.speed=

0.2+

Math.random()*0.5;

scene.add(particle);

energyParticles.push(particle);

}

/*==========================================
        UPDATE PART 14
==========================================*/

function updatePart14(time){

const t=time*.001;

/* MOTHERSHIP */

mothershipGroup.rotation.y+=.002;

mothershipGroup.position.y=

220+

Math.sin(t)*12;

engineLights.forEach((l,i)=>{

l.intensity=

2+

Math.sin(t*6+i);

});

/* DRONES */

drones.forEach(d=>{

d.userData.angle+=

d.userData.speed;

d.position.x+=

Math.cos(

d.userData.angle

)*.6;

d.position.z+=

Math.sin(

d.userData.angle

)*.6;

});

/* METEORS */

meteorStorm.forEach(m=>{

m.position.x-=

m.userData.speed;

m.position.y-=

m.userData.speed*.45;

if(m.position.x<-1200){

m.position.x=1200;

m.position.y=

900+

Math.random()*900;

}

});

/* MILKY WAY */

spiral.forEach((s,i)=>{

const angle=i*.12+t*.05;

const radius=i*.20;

s.position.x=

Math.cos(angle)*radius;

s.position.z=

Math.sin(angle)*radius-700;

s.position.y=

Math.sin(i*.2+t)*20;

});

milkyWayCore.rotation.y+=.0005;

/* PORTAL */

portalCore.scale.setScalar(

1+

Math.sin(t*4)*.18

);

portalCore.material.opacity=

0.20+

Math.sin(t*3)*0.10;

portalRings.forEach((r,i)=>{

r.rotation.z+=.003+i*.0002;

r.scale.setScalar(

1+

Math.sin(t*2+i)*.08

);

});

/* ENERGY */

energyParticles.forEach((p,i)=>{

p.position.y+=

Math.sin(t+i)*

p.userData.speed;

p.position.x+=

Math.cos(t+i)*

p.userData.speed*.5;

});

}
/* ==========================================
        COMP PORTAL GALAXY ENGINE V2
              PART - 15
        FINAL ANIMATION ENGINE
==========================================*/

/*==========================================
        CAMERA PARALLAX
==========================================*/

let targetX = 0;
let targetY = 0;

window.addEventListener("mousemove",(e)=>{

targetX=(e.clientX/window.innerWidth-.5)*40;

targetY=(e.clientY/window.innerHeight-.5)*25;

});

/*==========================================
        CLOCK
==========================================*/

const engineClock=new THREE.Clock();

/*==========================================
        RESIZE
==========================================*/

window.addEventListener("resize",()=>{

camera.aspect=

window.innerWidth/

window.innerHeight;

camera.updateProjectionMatrix();

renderer.setSize(

window.innerWidth,

window.innerHeight

);

renderer.setPixelRatio(

Math.min(

window.devicePixelRatio,

2

)

);

});

/*==========================================
        MAIN ANIMATE
==========================================*/

function animate(){

requestAnimationFrame(animate);

const elapsed=

engineClock.getElapsedTime();

const time=

performance.now();

/* CAMERA */

camera.position.x+=

(targetX-camera.position.x)*0.03;

camera.position.y+=

(-targetY-camera.position.y)*0.03;

camera.lookAt(

scene.position

);

/* MASTER ROTATION */

universe.rotation.y+=0.00015;

starLayer.rotation.y+=0.00005;

nebulaLayer.rotation.y+=0.00003;

/* PART 2 */

galaxyGroup.rotation.y+=galaxySpeed;

nebulaGroup.rotation.y+=nebulaSpeed;

deepStars.rotation.y+=0.00002;

coreGlow.scale.setScalar(

1+

Math.sin(elapsed*2)*0.08

);

/* PART 3 */

updateGalaxyEffects(time);

/* PART 4 */

if(typeof updatePart4==="function"){

updatePart4(time);

}

/* PART 5 */

if(typeof updatePart5==="function"){

updatePart5(time);

}

/* PART 6 */

if(typeof updatePart6==="function"){

updatePart6(time);

}

/* PART 7 */

if(typeof updatePart7==="function"){

updatePart7(time);

}

/* PART 8 */

if(typeof updatePart8==="function"){

updatePart8(time);

}

/* PART 9 */

if(typeof updatePart9==="function"){

updatePart9(time);

}

/* PART 10 */

if(typeof updatePart10==="function"){

updatePart10(time);

}

/* PART 11A */

if(typeof updatePart11A==="function"){

updatePart11A(time);

}

/* PART 11B */

if(typeof updatePart11B==="function"){

updatePart11B(time);

}

/* PART 12 */

if(typeof updatePart12==="function"){

updatePart12(time);

}

/* PART 13 */

if(typeof updatePart13==="function"){

updatePart13(time);

}

/* PART 14 */

if(typeof updatePart14==="function"){

updatePart14(time);

}

/* GLOBAL FLOAT */

scene.rotation.z=

Math.sin(

elapsed*.08

)*.003;

/* RENDER */

renderer.render(

scene,

camera

);

}

/*==========================================
        START ENGINE
==========================================*/

animate();