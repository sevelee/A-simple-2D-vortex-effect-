class particle {
    float x,y;
    float vx, vy;
    float strength;
    int size;
    float lastX, lastY;

    particle()
    {
        x = 0;
        y = 0;
        vx = 0;
        vy = 0;
        strength = 0;
        size = 0;
    }

    particle(float _x, float _y,float _vx, float _vy, float _s, int _size)
    {
        x = _x;
        y = _y;
        vx = _vx;
        vy = _vy;
        strength = _s;
        size = _size;
    }

    void DrawParticle()
    {
        int screenx, screeny;
        screenx = (int)x;
        screeny = (int)y;
        PositionCheck(2);
        ellipse(screenx, screeny, size, size);
    }

    void DrawParticleLine()
    {
        int _x, _y, lx, ly;
        _x = (int)x;
        _y = (int)y;
        lx = (int)lastX;
        ly = (int)lastY;
        line(_x, _y, lx, ly);
    }

    void PositionCheck(int xx)
    {
        if (xx == 1)
        {
            x = (x < 0) ? width : x;
            x = (x > width) ? 0 : x;
            y = (y < 0) ? height : y;
            y = (y > height) ? 0 : y;
        }
        if (xx == 2)
        {
            if ((x < 0) || (x > width) || (y < 0) || (y > height))
            {
                x = random(0, width);
                y = random(0, height);
                lastX = x;
                lastY = y;
            }
        }
    }
}