class Frontera
{
  float a, b, c, d;
  float o, p, q, r;

  float ancho, disty, distyApertura, umbralIngreso;

  float mov, apertura, topeApertura, velApertura, tiempoApertura;

  boolean abierto;

  color farbe= color (0);

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
    velApertura=5;
    tiempoApertura=3;
    umbralIngreso=100;
  }


  Frontera (float apertura_)
  {
    rectMode(CORNERS);
  }


  void dibuja() 
  {
    pushStyle();
    fill(farbe);
    rect(a, b, c, d-apertura);
    rect(o, p+apertura, q, r);
    popStyle();

    evadistyApertura();
  }

  void comportamiento(boolean abre_)
  {
    if (abre_ && apertura<topeApertura)
    {
      apertura+=velApertura;
    }
    if (!abre_ && apertura>0)
    {
      apertura-=velApertura;
    }

    abierto= (apertura>topeApertura/2 ? true:false);
    println(apertura+"____"+abierto);
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


  void evadistyApertura()
  {
    distyApertura= dist(getPuertas()[0][2]-ancho, getPuertas()[0][3], getPuertas()[1][0], getPuertas()[1][1]);
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


  boolean getAbierto()
  {
    return abierto;
  }

  float getUmbral()
  {
    return umbralIngreso;
  }

  float getDistyApertura()
  {
    return distyApertura;
  }

  float getDisty()
  {
    return disty;
  }
}//cierra class frontera
