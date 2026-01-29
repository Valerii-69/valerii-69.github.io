
precision mediump float;

uniform vec2  u_res;
uniform float u_time;
uniform float u_fon;
uniform float u_nprm;
uniform float u_zoom;
// аудио
uniform float u_low;
uniform float u_mid;
uniform float u_high;

uniform float u_lowGain;
uniform float u_midGain;
uniform float u_highGain;

// морфинг
uniform float u_mix;
uniform float u_gamma;

// debug
uniform int u_debugMode;
/*
const float u_fon = (u_fon);
const float u_nprm = (u_nprm);
const float u_zoom = (u_zoom);
const float u_mix = (u_mix);
const float u_gamma = (u_gamma);
*/
// глобальные аудио
float bass, midBand, treble, timeVal, prm2D;
// =============================
// УТИЛИТЫ
// =============================
float logGain(float x, float gain) {
    return pow(x + 1e-6, gain);
}

float hash(float x) {
//    return fract(sin(x / 123.456) * 789.123);
	return fract(sin((x / 7900.456) * 89.123));
}

// =============================
// 2D ФРАКТАЛ (цвет)
// =============================
// TwistedGrid
vec3 render2D(vec2 uv) {
    float x = uv.x + sin(uv.y*5.0 + u_time*0.3) * bass;
    float y = uv.y + cos(uv.x*5.0 + u_time*0.2) * midBand;
    float val = sin(x*10.0)*cos(y*10.0);
    val = (val + 1.0) * 0.5;
    return vec3(u_fon)*(val*bass, val*midBand, val*treble);
}

// =============================
// 2D → псевдо‑объём (DE)
// =============================
float fractal2D_DE(vec3 p) {
    vec3 col = render2D(p.xy);
    return length(col) * 0.2;
}

// =============================
// 3D / DE ФРАКТАЛ
// =============================
// Voronoi Cells
float fractal3D(vec3 p){
    vec3 ip = floor(p);
    vec3 fp = fract(p);
    float d = 1.0;
    
    for(int z=-1; z<=1; z++)
    for(int y=-1; y<=1; y++)
    for(int x=-1; x<=1; x++){
        vec3 cell = vec3(float(x), float(y), float(z));
        vec3 random = fract(sin(ip + cell) * vec3(43758.5453, 23421.631, 59238.324));
        vec3 point = cell + 0.5 + 0.5 * sin(u_time + 6.2831 * random);
        d = min(d, length(fp - point));
    }
    
    return d - 0.3;
}

// =============================
// ВРАЩЕНИЕ
// =============================
vec3 rotateY(vec3 p, float a) {
    float c = cos(a), s = sin(a);
    return vec3(c*p.x + s*p.z, p.y, -s*p.x + c*p.z);
}

// =============================
// ТРОЙНОЙ МОРФИНГ DE
// =============================
float fractalDE(vec3 p) {

    float de2D = fractal2D_DE(p);
    float de3D = fractal3D(rotateY(p, u_time * 0.3));

    // нормализация
    de2D *= 0.2;
    de3D *= 4.0;

    float phase1 = smoothstep(0.0, 0.5, u_mix); // 2D → pseudo
    float phase2 = smoothstep(0.5, 1.0, u_mix); // pseudo → 3D

    float de_phase1 = mix(0.0, de2D, phase1);
    float de_phase2 = mix(de2D, de3D, phase2);

    return mix(de_phase1, de_phase2, phase2);
}

// =============================
// MAP + NORMAL
// =============================
float map(vec3 p) {
    return fractalDE(p);
}

vec3 getNormal(vec3 p) {
    float e = 0.002;
    vec2 k = vec2(1.0, -1.0);

    return normalize(
        k.xyy * map(p + k.xyy * e) +
        k.yyx * map(p + k.yyx * e) +
        k.yxy * map(p + k.yxy * e) +
        k.xxx * map(p + k.xxx * e)
    );
}

// =============================
// RAYMARCH
// =============================
int g_raySteps = 0;

float rayMarch(vec3 ro, vec3 rd, out vec3 pHit) {
    float t = 0.0;
    const float tMax = 50.0;

    for (int i = 0; i < 120; i++) {
        vec3 p = ro + rd * t;
        float d = map(p);

        if (d < 0.001) {
            g_raySteps = i;
            pHit = p;
            return t;
        }

        if (t > tMax) break;
        t += d;
    }

    g_raySteps = 120;
    pHit = ro + rd * tMax;
    return -1.0;
}

// =============================
// CAMERA
// =============================
vec3 getRayDir(vec2 uv, vec3 ro, vec3 target, float fov) {
    vec3 f = normalize(target - ro);
    vec3 r = normalize(vec3(f.z, 0.0, -f.x));
    vec3 u = normalize(cross(r, f));

    float z = 1.0 / tan(radians(fov) * 0.5);
    return normalize(f * z * u_zoom + r * uv.x + u * uv.y);
}

vec3 cameraPos(float t) {
    float r = 6.0;
    float a = t * 0.25;
    float h = 2.5 * sin(t * 0.15);
    return vec3(r * cos(a), h, r * sin(a));
}

// =============================
// MAIN
// =============================
void main() {

    // аудио
    bass    = logGain(u_low,  u_lowGain);
    midBand = logGain(u_mid,  u_midGain);
    treble  = logGain(u_high, u_highGain);
    timeVal = u_time;

    // UV
    vec2 uv = (gl_FragCoord.xy / u_res) * 2.0 - 1.0;
    uv.x *= u_res.x / u_res.y;

    // камера
    vec3 ro = cameraPos(u_time);
    vec3 rd = getRayDir(uv, ro, vec3(0.0), 45.0);

    // raymarch
    vec3 pHit;
    float t = rayMarch(ro, rd, pHit);

    vec3 col;

    if (t > 0.0) {

        vec3 n = getNormal(pHit);

        vec3 lightDir = normalize(vec3(0.5, 1.0, 0.3));
        float diff = max(dot(n, lightDir), 0.0);
        float rim = pow(1.0 - max(dot(n, -rd), 0.0), 3.0);

        float smooth = pow(clamp(t / 20.0, 0.0, 1.0), 0.7);

        float rnd  = 0.1 + 0.8 * hash(u_time * 1.234);
        float rnd1 = 0.1 + 0.8 * hash(u_time * 2.345);
        float rnd2 = 0.1 + 0.8 * hash(u_time * 3.456);

        vec3 matCol = vec3(
            rnd  + 0.5 * sin(smooth + bass    * 5.0),
            rnd1 + 0.5 * sin(smooth + midBand * 5.0 + 2.0),
            rnd2 + 0.5 * sin(smooth + treble  * 5.0 + 4.0)
        );
		if (u_debugMode == 0) prm2D = 200.0;
        if (u_debugMode == 1) prm2D = treble; //col = 0.5 + 0.5 * n;
        if (u_debugMode == 2) col = vec3(diff);
        if (u_debugMode == 3) col = vec3(float(g_raySteps) / 120.0);


        vec3 col3D = matCol * (0.15 + 0.85 * diff) + rim * vec3(0.8, 0.7, 1.0);
        vec3 col2D = render2D(uv * prm2D);

        float phaseColor = smoothstep(0.3, 1.0, u_mix);

        col = mix(col2D, col3D, phaseColor);

    } else {
        col = render2D(uv * prm2D);
    }

    col = pow(col, vec3(u_gamma)); // gamma

    gl_FragColor = vec4(col, 1.0);
}
