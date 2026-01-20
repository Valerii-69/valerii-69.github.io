// FRACT32 Lissajous
/*test1*/
vec3 render2D(vec2 uv) {
    float a = 2.0 + bass * 5.0;
    float b = 3.0 + midBand * 4.0;
    float c = 4.0 + treble * 6.0;

    vec2 p = vec2(
        sin(a * uv.y + timeVal*0.5),
        sin(b * uv.x + timeVal*0.3)
    );
    float n = length(p) * 0.5;
    return vec3(0.3 + bass*0.7, 0.2 + midBand*0.8, 0.4 + treble*0.8) * n;
}
// E32
// FRACT32 MandelAudio
/*test2*/
vec3 render2D(vec2 uv) {
    vec2 z = uv;
    vec2 c = uv * (0.6 + bass*0.6);
    float it = 0.0;
    for(int i=0;i<100;i++){
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) + c;
        if(dot(z,z)>4.0) break;
        it++;
    }
    float n = it/100.0;
    return vec3(n*bass, n*midBand, n*treble);
}
// E32
// FRACT32 BurningShip
/*test3*/
vec3 render2D(vec2 uv) {
    vec2 z = uv;
    vec2 c = uv;
    float it = 0.0;
    for(int i=0;i<120;i++){
        z = vec2(abs(z.x), abs(z.y));
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) + c;
        if(dot(z,z)>4.0) break;
        it++;
    }
    float n = it/120.0;
    return vec3(n, n*n*midBand, n*treble);
}
// E32
// FRACT32 CircleWaves
/*test4*/
vec3 render2D(vec2 uv) {
    float rCW = length(uv);
    float theta = atan(uv.y, uv.x);
    float val = sin(10.0*rCW + bass*20.0 + theta*5.0*midBand) * cos(15.0*rCW + treble*10.0 + timeVal*0.5);
    val = (val + 1.0)*0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E32
// FRACT32 TwistedGrid
/*test5*/
vec3 render2D(vec2 uv) {
    float xTG = uv.x + sin(uv.y*5.0 + timeVal*0.3) * bass;
    float yTG = uv.y + cos(uv.x*5.0 + timeVal*0.2) * midBand;
    float val = sin(xTG*10.0)*cos(yTG*10.0);
    val = (val + 1.0) * 0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E32
// FRACT32 SpiralTunnel
/*test6*/
vec3 render2D(vec2 uv) {
    float angleST = atan(uv.y, uv.x) + timeVal*0.5;
    float radiusST = length(uv) + bass*0.5;
    float val = sin(10.0*radiusST - 5.0*angleST);
    val = (val + 1.0) * 0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E32
// FRACT32 WaveInterference
/*test7*/
vec3 render2D(vec2 uv) {
    float val = sin(uv.x*10.0 + timeVal*0.7 + bass*5.0) + cos(uv.y*10.0 + timeVal*0.5 + midBand*3.0);
    val *= sin(length(uv)*20.0 + treble*10.0);
    val = (val + 2.0) * 0.25; // нормализация в 0..1
    return vec3(val*bass, val*midBand, val*treble);
}
// E32
// FRACT132 Lissajous
/*test8*/
vec3 render2D(vec2 uv) {
    float a = 2.0 + bass * 5.0;
    float b = 3.0 + midBand * 4.0;
    float c = 4.0 + treble * 6.0;

    vec2 p = vec2(
        sin(a * uv.y + timeVal*0.5),
        sin(b * uv.x + timeVal*0.3)
    );
    float n = length(p) * 0.5;
    return vec3(0.3 + bass*0.7, 0.2 + midBand*0.8, 0.4 + treble*0.8) * n;
}
// E132
// FRACT132 MandelAudio
/*test9*/
vec3 render2D(vec2 uv) {
    vec2 z = uv;
    vec2 c = uv * (0.6 + bass*0.6);
    float it = 0.0;
    for(int i=0;i<100;i++){
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) + c;
        if(dot(z,z)>4.0) break;
        it++;
    }
    float n = it/100.0;
    return vec3(n*bass, n*midBand, n*treble);
}
// E132
// FRACT132 BurningShip
/*test10*/
vec3 render2D(vec2 uv) {
    vec2 z = uv;
    vec2 c = uv;
    float it = 0.0;
    for(int i=0;i<120;i++){
        z = vec2(abs(z.x), abs(z.y));
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) + c;
        if(dot(z,z)>4.0) break;
        it++;
    }
    float n = it/120.0;
    return vec3(n, n*n*midBand, n*treble);
}
// E132
// FRACT132 CircleWaves
/*test11*/
vec3 render2D(vec2 uv) {
    float rCW = length(uv);
    float theta = atan(uv.y, uv.x);
    float val = sin(10.0*rCW + bass*20.0 + theta*5.0*midBand) * cos(15.0*rCW + treble*10.0 + timeVal*0.5);
    val = (val + 1.0)*0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E132
// FRACT132 TwistedGrid
/*test12*/
vec3 render2D(vec2 uv) {
    float xTG = uv.x + sin(uv.y*5.0 + timeVal*0.3) * bass;
    float yTG = uv.y + cos(uv.x*5.0 + timeVal*0.2) * midBand;
    float val = sin(xTG*10.0)*cos(yTG*10.0);
    val = (val + 1.0) * 0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E132
// FRACT132 SpiralTunnel
/*test13*/
vec3 render2D(vec2 uv) {
    float angleST = atan(uv.y, uv.x) + timeVal*0.5;
    float radiusST = length(uv) + bass*0.5;
    float val = sin(10.0*radiusST - 5.0*angleST);
    val = (val + 1.0) * 0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E132
// FRACT132 WaveInterference
/*test14*/
vec3 render2D(vec2 uv) {
    float val = sin(uv.x*10.0 + timeVal*0.7 + bass*5.0) + cos(uv.y*10.0 + timeVal*0.5 + midBand*3.0);
    val *= sin(length(uv)*20.0 + treble*10.0);
    val = (val + 2.0) * 0.25; // нормализация в 0..1
    return vec3(val*bass, val*midBand, val*treble);
}
// E132
// FRACT432 Lissajous
/*test15*/
vec3 render2D(vec2 uv) {
    float a = 2.0 + bass * 5.0;
    float b = 3.0 + midBand * 4.0;
    float c = 4.0 + treble * 6.0;

    vec2 p = vec2(
        sin(a * uv.y + timeVal*0.5),
        sin(b * uv.x + timeVal*0.3)
    );
    float n = length(p) * 0.5;
    return vec3(0.3 + bass*0.7, 0.2 + midBand*0.8, 0.4 + treble*0.8) * n;
}
// E432
// FRACT432 MandelAudio
/*test16*/
vec3 render2D(vec2 uv) {
    vec2 z = uv;
    vec2 c = uv * (0.6 + bass*0.6);
    float it = 0.0;
    for(int i=0;i<100;i++){
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) + c;
        if(dot(z,z)>4.0) break;
        it++;
    }
    float n = it/100.0;
    return vec3(n*bass, n*midBand, n*treble);
}
// E432
// FRACT432 BurningShip
/*test17*/
vec3 render2D(vec2 uv) {
    vec2 z = uv;
    vec2 c = uv;
    float it = 0.0;
    for(int i=0;i<120;i++){
        z = vec2(abs(z.x), abs(z.y));
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) + c;
        if(dot(z,z)>4.0) break;
        it++;
    }
    float n = it/120.0;
    return vec3(n, n*n*midBand, n*treble);
}
// E432
// FRACT432 CircleWaves
/*test18*/
vec3 render2D(vec2 uv) {
    float rCW = length(uv);
    float theta = atan(uv.y, uv.x);
    float val = sin(10.0*rCW + bass*20.0 + theta*5.0*midBand) * cos(15.0*rCW + treble*10.0 + timeVal*0.5);
    val = (val + 1.0)*0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E432
// FRACT432 TwistedGrid
/*test19*/
vec3 render2D(vec2 uv) {
    float xTG = uv.x + sin(uv.y*5.0 + timeVal*0.3) * bass;
    float yTG = uv.y + cos(uv.x*5.0 + timeVal*0.2) * midBand;
    float val = sin(xTG*10.0)*cos(yTG*10.0);
    val = (val + 1.0) * 0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E432
// FRACT432 SpiralTunnel
/*test20*/
vec3 render2D(vec2 uv) {
    float angleST = atan(uv.y, uv.x) + timeVal*0.5;
    float radiusST = length(uv) + bass*0.5;
    float val = sin(10.0*radiusST - 5.0*angleST);
    val = (val + 1.0) * 0.5;
    return vec3(val*bass, val*midBand, val*treble);
}
// E432
// FRACT432 WaveInterference
/*test21*/
vec3 render2D(vec2 uv) {
    float val = sin(uv.x*10.0 + timeVal*0.7 + bass*5.0) + cos(uv.y*10.0 + timeVal*0.5 + midBand*3.0);
    val *= sin(length(uv)*20.0 + treble*10.0);
    val = (val + 2.0) * 0.25; // нормализация в 0..1
    return vec3(val*bass, val*midBand, val*treble);
}
// E432
// FRACT2 mandelbrot 
/*test22*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.15;
y = 2.0*xy + cy + u_mid * 0.15;
// EN2 
// FRACT2 mandelbrot_smooth 
/*test23*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_high * 0.15;
y = 2.0*xy + cy + u_mid * 0.15;
// EN2 
// FRACT2 julia1 
/*test24*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = 2.0*xy + cy + u_mid * 0.10;
// EN2 
// FRACT2 julia2 
/*test25*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = 2.0*xy + cy + u_high * 0.10;
// EN2 
// FRACT2 burning_ship 
/*test26*/
x = abs(x);
y = abs(y);
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = 2.0*xy + cy + u_mid * 0.10;
// EN2 
// FRACT2 multibrot3 
/*test27*/
float x2 = x*x;
float y2 = y*y;
float r = sqrt(x2 + y2);
float theta = atan(y, x);
if (r > 4.0) { 
escaped = true;
}
float rp = r*r*r;
float tp = theta * 3.0;
x = rp * cos(tp) + cx + u_low * 0.10;
y = rp * sin(tp) + cy + u_mid * 0.10;
// EN2 
// FRACT2 multibrot4 
/*test28*/
float x2 = x*x;
float y2 = y*y;
float r = sqrt(x2 + y2);
float theta = atan(y, x);
if (r > 4.0) { 
escaped = true;
}
float rp = pow(r, 4.0);
float tp = theta * 4.0;
x = rp * cos(tp) + cx + u_low * 0.10;
y = rp * sin(tp) + cy + u_mid * 0.10;
// EN2 
// FRACT2 buffalo 
/*test29*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = abs(x2 - y2) + cx + u_low * 0.10;
y = 2.0*abs(xy) + cy + u_mid * 0.10;
// EN2 
// FRACT2 phoenix 
/*test30*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
float px = 0.3 * u_low;
float py = 0.3 * u_mid;
x = x2 - y2 + px * x + cx;
y = 2.0*xy + py * y + cy;
// EN2 
// FRACT2 celtic 
/*test31*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = abs(x2 - y2) + cx + u_low * 0.10;
y = 2.0*xy + cy + u_mid * 0.10;
// EN2 
// FRACT2 perpEN2icular 
/*test32*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = -2.0*abs(xy) + cy + u_mid * 0.10;
// EN2 
// FRACT2 tricorn 
/*test33*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = -2.0*xy + cy + u_mid * 0.10;
// EN2 
// FRACT2 mandelbox_simple 
/*test34*/
float x2 = x*x;
float y2 = y*y;
float scale = -1.7;
float minR = 0.5;
float fixedR = 1.0;
float r2 = x2 + y2;
if (r2 > 16.0) { 
escaped = true;
}
float rMin2 = minR*minR;
float rFixed2 = fixedR*fixedR;
float factor = 1.0;
if (r2 < rMin2) { 
factor = rFixed2 / rMin2;
}
else if (r2 < rFixed2) { 
factor = rFixed2 / r2;
}
float audioScale = 1.0 + u_high * 0.3;
x = x * factor * scale * audioScale + cx;
y = y * factor * scale * audioScale + cy;
// EN2 
// FRACT2 sin_z2 
/*test35*/
float x2 = x*x;
float y2 = y*y;
float xr = x2 - y2;
float yr = 2.0*x*y;
float cosh_y = 0.5 * (exp(yr) + exp(-yr));
float sinh_y = 0.5 * (exp(yr) - exp(-yr));
float sx = sin(xr) * cosh_y;
float sy = cos(xr) * sinh_y;
float r2 = sx*sx + sy*sy;
if (r2 > 16.0) { 
escaped = true;
}
x = sx + cx + u_low * 0.05;
y = sy + cy + u_mid * 0.05;
// EN2 
// FRACT2 custom_external 
/*test36*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = 2.0*xy + cy + u_mid * 0.10;
// EN2 
// FRACT2 newton_basic 
/*test37*/
{float x2 = x*x;
float y2 = y*y;
float x3 = x*x2 - 3.0*x*y2;
float y3 = 3.0*x2*y - y*y2;
float denom = 3.0*(x2 - y2)*(x2 - y2) + 12.0*x2*y2 + 1e-3;
float nx = x - (x3 - 1.0) / denom;
float ny = y - y3 / denom;
nx += u_low * 0.05;
ny += u_mid * 0.05;
x = nx;
y = ny;
   g_fx = nx;
   g_fy = ny;
   g_fz = 0.0;
if (x*x + y*y < 1e-3) { 
escaped = true;
}}
// EN2 
// FRACT2 newton_param 
/*test38*/
{float x2 = x*x;
float y2 = y*y;
float x3 = x*x2 - 3.0*x*y2;
float y3 = 3.0*x2*y - y*y2;
float denom = 3.0*(x2 - y2)*(x2 - y2) + 12.0*x2*y2 + 1e-3;
float nx = x - (x3 - 1.0) / denom;
float ny = y - y3 / denom;
nx += u_high * 0.05;
ny += u_high * 0.05;
x = nx;
y = ny;
   g_fx = nx;
   g_fy = ny;
   g_fz = 0.0;
if (x*x + y*y < 1e-3) { 
escaped = true;
}}
// EN2 
// FRACT2 clifford 
/*test39*/
{float x2 = x*x;
float y2 = y*y;
float nx = sin(1.4*y) + cos(1.4*x);
float ny = sin(1.4*x) + cos(1.4*y);
nx += u_low * 0.1;
ny += u_mid * 0.1;
x = nx + cx*0.1;
y = ny + cy*0.1;
   g_fx = nx;
   g_fy = ny;
   g_fz = 0.0;
if (x2 + y2 > 64.0) { 
escaped = true;
}}
// EN2 
// FRACT2 hopalong 
/*test40*/
{float x2 = x*x;
float y2 = y*y;
float nx = y - sign(x)*sqrt(abs(3.0*x - 1.0));
float ny = 1.0 - x;
nx += u_low * 0.05;
ny += u_mid * 0.05;
x = nx + cx*0.05;
y = ny + cy*0.05;
   g_fx = nx;
   g_fy = ny;
   g_fz = 0.0;
if (x2 + y2 > 64.0) { 
escaped = true;
}}
// EN2 
// FRACT2 ikeda 
/*test41*/
{float x2 = x*x;
float y2 = y*y;
float t = 0.4 - 6.0/(1.0 + x*x + y*y);
float nx = 1.0 + 0.9*(x*cos(t) - y*sin(t));
float ny = 0.9*(x*sin(t) + y*cos(t));
nx += u_low * 0.05;
ny += u_mid * 0.05;
x = nx + cx*0.05;
y = ny + cy*0.05;
   g_fx = nx;
   g_fy = ny;
   g_fz = 0.0;
if (x2 + y2 > 100.0) { 
escaped = true;
}}
// EN2 
// FRACT2 gumowski_mira 
/*test42*/
{float x2 = x*x;
float y2 = y*y;
float a = 0.5;
float b = 0.5;
float f = a*x + 2.0*(1.0 - a)*x*x / (1.0 + x*x);
float nx = y + f;
float ny = -x + b*y + f;
nx += u_low * 0.02;
ny += u_mid * 0.02;
x = nx + cx*0.02;
y = ny + cy*0.02;
   g_fx = nx;
   g_fy = ny;
   g_fz = 0.0;
if (x2 + y2 > 100.0) { 
escaped = true;
}}
// EN2 
// FRACT2 lissajous_dual 
/*test43*/
float x2 = x*x;
float y2 = y*y;
float r = sqrt(x2 + y2);
if (r > 3.0) { 
escaped = true;
}
float t = float(n) * 0.1 + u_high * 0.5;
float lx = 0.5 * sin(3.0 * t);
float ly = 0.5 * sin(2.0 * t);
float cs = cos(t);
float sn = sin(t);
float xr = x * cs - y * sn + lx;
float yr = x * sn + y * cs + ly;
float xr2 = xr*xr;
float yr2 = yr*yr;
if (xr2 + yr2 > 9.0) { 
escaped = true;
}
float xy = xr*yr;
x = xr2 - yr2 + cx + u_low * 0.05;
y = 2.0*xy + cy + u_mid * 0.05;
// EN2 
// FRACT2 swirl 
/*test44*/
float x2 = x*x;
float y2 = y*y;
float r2 = x2 + y2;
if (r2 > 16.0) { 
escaped = true;
}
float k = 0.5 + u_high * 0.5;
float angle = k * r2;
float cs = cos(angle);
float sn = sin(angle);
float xr = x*cs - y*sn;
float yr = x*sn + y*cs;
x = xr + cx + u_low * 0.05;
y = yr + cy + u_mid * 0.05;
// EN2 
// FRACT2 polar_power 
/*test45*/
float x2 = x*x;
float y2 = y*y;
float r = sqrt(x2 + y2);
float theta = atan(y, x);
if (r > 8.0) { 
escaped = true;
}
float p = 2.5 + u_high * 0.5;
float q = 3.0;
float rp = pow(r, p);
float tp = theta * q;
x = rp*cos(tp) + cx + u_low * 0.05;
y = rp*sin(tp) + cy + u_mid * 0.05;
// EN2 
// FRACT2 log_spiral 
/*test46*/
float x2 = x*x;
float y2 = y*y;
float r2 = x2 + y2;
if (r2 > 16.0) { 
escaped = true;
}
float r = sqrt(r2);
float theta = atan(y, x);
float s = 0.5 + 0.5*u_high;
float rLog = log(1.0 + r*s);
float theta2 = theta + s*0.2;
float xr = rLog * cos(theta2);
float yr = rLog * sin(theta2);
float xy = xr*yr;
x = xr*xr - yr*yr + cx + u_low * 0.05;
y = 2.0*xy + cy + u_mid * 0.05;
// EN2 
// FRACT2 wave_perturb 
/*test47*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
float wx = sin(1.5 * y + u_time) * u_low;
float wy = sin(1.2 * x + u_time*0.7) * u_mid;
x = x2 - y2 + cx + 0.2*wx;
y = 2.0*xy + cy + 0.2*wy;
// EN2 
// FRACT2 energy_escape 
/*test48*/
float x2 = x*x;
float y2 = y*y;
float limit = 4.0 + u_high * 4.0;
if (x2 + y2 > limit) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.05;
y = 2.0*xy + cy + u_mid * 0.05;
// EN2 
// FRACT2 time_julia 
/*test49*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
float tcx = cx + 0.3*sin(u_time) + u_low * 0.1;
float tcy = cy + 0.3*cos(u_time*0.7) + u_mid * 0.1;
x = x2 - y2 + tcx;
y = 2.0*xy + tcy;
// EN2 
// FRACT2 strip_bound 
/*test50*/
float x2 = x*x;
float y2 = y*y;
float r2 = x2 + y2;
if (r2 > 16.0) { 
escaped = true;
}
if (abs(y) > 2.0 + u_mid) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.05;
y = 2.0*xy + cy + u_mid * 0.05;
// EN2 
// FRACT2 box_fold_complex 
/*test51*/
float fold = 1.0;
if (x > fold) x = 2.0*fold - x;
else if (x < -fold) x = -2.0*fold - x;
if (y > fold) y = 2.0*fold - y;
else if (y < -fold) y = -2.0*fold - y;
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 16.0) { 
escaped = true;
}
float scale = 1.5 + u_high * 0.5;
x = x*scale + cx + u_low * 0.05;
y = y*scale + cy + u_mid * 0.05;
// EN2 
// FRACT2 inverse_mandel 
/*test52*/
float x2 = x*x;
float y2 = y*y;
float r2 = x2 + y2;
if (r2 < 1e-4 || r2 > 64.0) { 
escaped = true;
}
float inv = 1.0 / max(r2, 1e-4);
float xr = x*inv;
float yr = -y*inv;
float xy = xr*yr;
x = xr*xr - yr*yr + cx + u_low * 0.05;
y = 2.0*xy + cy + u_mid * 0.05;
// EN2 
// FRACT2 cross_FRACT2 
/*test53*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 9.0) { 
escaped = true;
}
float mask = step(0.2, abs(x)) * step(0.2, abs(y));
float xy = x*y;
x = x2 - y2 + cx*mask + u_low * 0.05;
y = 2.0*xy + cy*mask + u_mid * 0.05;
// EN2 
// FRACT2 spiral_julia 
/*test54*/
float x2 = x*x;
float y2 = y*y;
float r2 = x2 + y2;
if (r2 > 4.0) { 
escaped = true;
}
float r = sqrt(r2);
float theta = atan(y, x) + (0.2 + 0.3*u_high) * r;
float nr = r * (1.0 + 0.1*r);
x = nr*cos(theta) + cx + u_low * 0.05;
y = nr*sin(theta) + cy + u_mid * 0.05;
// EN2 
// FRACT2 heart_like 
/*test55*/
{float x2 = x*x;
float y2 = y*y;
float r = sqrt(x2 + y2);
float theta = atan(y, x);
if (r > 4.0) { 
escaped = true;
}
float nx = r * sin(theta) * sqrt(abs(cos(theta))) + cx + u_low * 0.05;
float ny = -r * cos(theta) + cy + u_mid * 0.05;
x = nx;
y = ny;
   g_fx = nx;
   g_fy = ny;
   g_fz = 0.0;}
// EN2 
// FRACT2 noisy_mandel 
/*test56*/
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
float noise = sin(u_time + float(n)*0.1) * (0.5*u_high);
x = x2 - y2 + cx + noise + u_low * 0.05;
y = 2.0*xy + cy + noise + u_mid * 0.05;
// EN2 
// FRACTAL 2: Mandelbulb
/*test57*/
float fractalDE(vec3 p){
    p *= 0.5;
    vec3 z = p;
    float dr = 1.0;
    float r = 0.0;
    const int ITER = 12;
    const float POWER = 8.0;

    for(int i=0; i<ITER; i++){
        r = length(z);
        if(r > 2.0) break;

        float theta = acos(z.z / r);
        float phi   = atan(z.y, z.x);
        dr = pow(r, POWER - 1.0) * POWER * dr + 1.0;

        float zr = pow(r, POWER);
        theta *= POWER;
        phi   *= POWER;

        z = zr * vec3(
            sin(theta) * cos(phi),
            sin(theta) * sin(phi),
            cos(theta)
        );
        z += p;
    }

    return 0.5 * log(r) * r / dr;
}
// END 
// FRACTAL noisy_mandel 
/*test58*/
float fractalDE(vec3 p){
    float scale = 1.0;
    for(int i=0; i<5; i++){
        p = abs(p);
        if(p.x < p.y) p.xy = p.yx;
        if(p.x < p.z) p.xz = p.zx;
        p = p * 3.0 - 2.0;
        scale *= 3.0;
    }
    float d = length(max(abs(p)-1.0, 0.0)) / scale;
    return d - 0.02;
}
// END 
// FRACTAL noisy_mandel 
/*test59*/
float fractalDE(vec3 p){
    float scale = 1.0;
    for(int i=0; i<7; i++){
        p = abs(p);
        if(p.x - p.y < 0.0) p.xy = p.yx;
        if(p.x - p.z < 0.0) p.xz = p.zx;
        p = p * 1.5 - vec3(0.5, 0.7, 0.6);
        scale *= 1.5;
    }
    float d = (length(p) - 0.5) / scale;
    return d;
}
// END 
// FRACTAL noisy_mandel 
/*test60*/
float gyroid(vec3 p){
    return abs(
        sin(p.x) * cos(p.y) +
        sin(p.y) * cos(p.z) +
        sin(p.z) * cos(p.x)
    ) - 0.5;
}
float fractalDE(vec3 p){
    p *= 1.2;
    float d = gyroid(p);
    return d * 0.7;
}
// END 
// FRACTAL noisy_mandel 
/*test61*/
float fractalDE(vec3 p){
    float d = 1e9;
    vec3 q = p;
    for(int i=0; i<6; i++){
        float r = 0.8 + 0.3 * float(i);
        float di = abs(length(q) - r) - 0.05;
        d = min(d, di);
        q = q * 1.3 + vec3(0.3, -0.2, 0.1);
    }
    return d;
}
// END 
// FRACTAL noisy_mandel
/*test62*/
float torus(vec3 p, vec2 t){
    vec2 q = vec2(length(p.xz) - t.x, p.y);
    return length(q) - t.y;
}
float fractalDE(vec3 p){
    // повтор по пространству
    vec3 q = p;
    q.xy = mod(q.xy + 2.0, 4.0) - 2.0;
    q.z  = mod(q.z  + 2.0, 4.0) - 2.0;

    float d = torus(q, vec2(1.0, 0.2));
    return d;
}
// END
// FRACTAL noisy_mandel 
/*test63*/
float fractalDE(vec3 p){
    // мягкий тоннель
    float r = 0.6 + 0.1 * sin(p.z * 2.0);
    return length(p.xy) - r;
}
// END