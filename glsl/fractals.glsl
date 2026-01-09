/* FRACTAL mandelbrot */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.15;
y = 2.0*xy + cy + u_mid * 0.15;
/* END */
/* FRACTAL mandelbrot_smooth */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_high * 0.15;
y = 2.0*xy + cy + u_mid * 0.15;
/* END */
/* FRACTAL julia1 */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = 2.0*xy + cy + u_mid * 0.10;
/* END */
/* FRACTAL julia2 */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = 2.0*xy + cy + u_high * 0.10;
/* END */
/* FRACTAL burning_ship */
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
/* END */
/* FRACTAL multibrot3 */
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
/* END */
/* FRACTAL multibrot4 */
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
/* END */
/* FRACTAL buffalo */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = abs(x2 - y2) + cx + u_low * 0.10;
y = 2.0*abs(xy) + cy + u_mid * 0.10;
/* END */
/* FRACTAL phoenix */
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
/* END */
/* FRACTAL celtic */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = abs(x2 - y2) + cx + u_low * 0.10;
y = 2.0*xy + cy + u_mid * 0.10;
/* END */
/* FRACTAL perpendicular */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = -2.0*abs(xy) + cy + u_mid * 0.10;
/* END */
/* FRACTAL tricorn */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = -2.0*xy + cy + u_mid * 0.10;
/* END */
/* FRACTAL mandelbox_simple */
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
/* END */
/* FRACTAL sin_z2 */
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
/* END */
/* FRACTAL custom_external */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.10;
y = 2.0*xy + cy + u_mid * 0.10;
/* END */
/* FRACTAL newton_basic */
float x2 = x*x;
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
if (x*x + y*y < 1e-3) { 
escaped = true;
}
/* END */
/* FRACTAL newton_param */
float x2 = x*x;
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
if (x*x + y*y < 1e-3) { 
escaped = true;
}
/* END */
/* FRACTAL clifford */
float x2 = x*x;
float y2 = y*y;
float nx = sin(1.4*y) + cos(1.4*x);
float ny = sin(1.4*x) + cos(1.4*y);
nx += u_low * 0.1;
ny += u_mid * 0.1;
x = nx + cx*0.1;
y = ny + cy*0.1;
if (x2 + y2 > 64.0) { 
escaped = true;
}
/* END */
/* FRACTAL hopalong */
float x2 = x*x;
float y2 = y*y;
float nx = y - sign(x)*sqrt(abs(3.0*x - 1.0));
float ny = 1.0 - x;
nx += u_low * 0.05;
ny += u_mid * 0.05;
x = nx + cx*0.05;
y = ny + cy*0.05;
if (x2 + y2 > 64.0) { 
escaped = true;
}
/* END */
/* FRACTAL ikeda */
float x2 = x*x;
float y2 = y*y;
float t = 0.4 - 6.0/(1.0 + x*x + y*y);
float nx = 1.0 + 0.9*(x*cos(t) - y*sin(t));
float ny = 0.9*(x*sin(t) + y*cos(t));
nx += u_low * 0.05;
ny += u_mid * 0.05;
x = nx + cx*0.05;
y = ny + cy*0.05;
if (x2 + y2 > 100.0) { 
escaped = true;
}
/* END */
/* FRACTAL gumowski_mira */
float x2 = x*x;
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
if (x2 + y2 > 100.0) { 
escaped = true;
}
/* END */
/* FRACTAL lissajous_dual */
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
/* END */
/* FRACTAL swirl */
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
/* END */
/* FRACTAL polar_power */
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
/* END */
/* FRACTAL log_spiral */
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
/* END */
/* FRACTAL wave_perturb */
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
/* END */
/* FRACTAL energy_escape */
float x2 = x*x;
float y2 = y*y;
float limit = 4.0 + u_high * 4.0;
if (x2 + y2 > limit) { 
escaped = true;
}
float xy = x*y;
x = x2 - y2 + cx + u_low * 0.05;
y = 2.0*xy + cy + u_mid * 0.05;
/* END */
/* FRACTAL time_julia */
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
/* END */
/* FRACTAL strip_bound */
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
/* END */
/* FRACTAL box_fold_complex */
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
/* END */
/* FRACTAL inverse_mandel */
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
/* END */
/* FRACTAL cross_fractal */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 9.0) { 
escaped = true;
}
float mask = step(0.2, abs(x)) * step(0.2, abs(y));
float xy = x*y;
x = x2 - y2 + cx*mask + u_low * 0.05;
y = 2.0*xy + cy*mask + u_mid * 0.05;
/* END */
/* FRACTAL spiral_julia */
float x2 = x*x;
float y2 = y*y;
float r2 = x2 + y2;
if (r2 > 16.0) { 
escaped = true;
}
float r = sqrt(r2);
float theta = atan(y, x) + (0.2 + 0.3*u_high) * r;
float nr = r*r;
x = nr*cos(theta) + cx + u_low * 0.05;
y = nr*sin(theta) + cy + u_mid * 0.05;
/* END */
/* FRACTAL heart_like */
float x2 = x*x;
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
/* END */
/* FRACTAL noisy_mandel */
float x2 = x*x;
float y2 = y*y;
if (x2 + y2 > 4.0) { 
escaped = true;
}
float xy = x*y;
float noise = sin(u_time + float(n)*0.1) * (0.5*u_high);
x = x2 - y2 + cx + noise + u_low * 0.05;
y = 2.0*xy + cy + noise + u_mid * 0.05;
/* END */