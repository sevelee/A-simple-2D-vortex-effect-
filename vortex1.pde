particle[] p;
int particleSize = 2000;

float rad_squared = 1000;
float factor;
float dt = 30;
float maxV = 100;

void InitParticle()
{
    p = new particle[particleSize];
    for (int i = 0; i < particleSize; ++i)
    {
        p[i] = new particle();
        p[i].x = random(0, width);
        p[i].y = random(0, height);
        p[i].vx = random(-1, 1);
        p[i].vy = random(-1, 1);
        p[i].strength = random(-2, 2);
        p[i].size = 1;
    }
}

float sqr(float a)
{
    return a * a;
}

void UpdateParticles()
{
    float dx, dy;
    dx = dy = 0.0f;
    float dist = 0;
    for (int i = 0; i < particleSize; ++i)
    {
        p[i].vx = p[i].vy = 0;
        for (int j = 0; j < particleSize; ++j)
        {
            dx = p[i].x - p[j].x;
            dy = p[i].y - p[j].y;
            dist = sqr(dx) + sqr(dy) + rad_squared;
            factor = p[j].strength / dist;
            p[i].vx -= dy * factor;
            p[i].vy += dx * factor;
        }
    }
    for (int i = 0; i < particleSize; ++i)
    {
        p[i].vx = (p[i].vx > maxV) ? maxV : p[i].vx;
        p[i].vy = (p[i].vy > maxV) ? maxV : p[i].vy;
        p[i].lastX = p[i].x;
        p[i].lastY = p[i].y;
        p[i].x += dt * p[i].vx;
        p[i].y += dt * p[i].vy;
        // p[i].DrawParticle();
        p[i].DrawParticleLine();
    }
}
 
void setup()
{
    size(400, 400);
    frameRate(30);
    InitParticle();
}

void draw()
{
    background(200);
    UpdateParticles();
    for (int i = 0; i < particleSize; ++i)
    {
        p[i].DrawParticle();
    }
    saveFrame("frames/####.png");
}