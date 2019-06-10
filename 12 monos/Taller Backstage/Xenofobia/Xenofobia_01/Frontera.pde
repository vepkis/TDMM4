class Frontera
{
  float a, b, c, d;
  float o, p, q, r;

  float ancho, disty, umbralIngreso;

  float mov, apertura, topeApertura, velApertura, tiempoApertura;
  Frontera ()
  {

    rectMode(CORNERS);

    ancho=20;
    a=width/2;
    b=0;
    c=a+ancho;
    d=height/2;

    o=a;
    p=d;
    q=a+ancho;
    r=height;

    topeApertura=50;
    velApertura=1;
    tiempoApertura=3;
    umbralIngreso=50;
  }


  Frontera (float apertura_)
  {
    rectMode(CORNERS);
  }


  void dibuja() 
  {
    rect(a, b, c, d-apertura);

    rect(o, p+apertura, q, r);
  }

  void comportamiento(boolean abre)
  {
    if (abre && apertura<topeApertura)
    {
      apertura+=velApertura;
    }
    if (!abre && apertura>0)
    {
      apertura-=velApertura;
    }
  }

  void evaluaIngresante(float evaX_, float evaY_)
  {

    disty= dist(evaX_, evaY_, c, d);

    if (disty<umbralIngreso)
    {
      comportamiento(true);
    } else
    {
      comportamiento(false);
    }
  }

  void setABCD(float a_, float b_, float c_, float d_)
  {
    a=a_;
    b=b_;
    c=c_;
    d=d_;
  }

  void setOPQR(float o_, float p_, float q_, float r_)
  {
    o=o_;
    p=p_;
    q=q_;
    r=r_;
  }

  void setMov(float mov_)
  {
    d=mov_;
  }

  float [][]  getPuertas()
  {
    float [][]puertas= new float[2][4];
    puertas[0][0]=a;    
    puertas[0][1]=b;    
    puertas[0][2]=c;    
    puertas[0][3]=d-apertura;    

    puertas[1][0]=o;    
    puertas[1][1]=p+apertura;    
    puertas[1][2]=q;    
    puertas[1][3]=r;

    return puertas;
  }
}//cierra class frontera
