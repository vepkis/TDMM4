class Frontera
{
  int cant=5, tamAlto, ancho;
  float mov, topeApertura, velApertura, tiempoApertura, umbralIngreso, umbralRechazo;
  ;

  //  float a, b, c, d;
  float [] a= new float [cant];
  float [] b= new float [cant];  
  float [] c= new float [cant];  
  float [] d= new float [cant];  


  float [] disty= new float [cant];  
  float [] apertura= new float [cant];  
  boolean [] permitePaso= new boolean [cant];


  color farbe= color (0);
  int alpha=255;


  Frontera ()
  {

    rectMode(CORNERS);

    ancho=width/20;
    tamAlto= height/cant;

    for (int i =0; i < a.length; i++)
    {
      a[i]=width/2;
      b[i]=tamAlto*i;
      c[i]=a[0]+ancho;
      d[i]=tamAlto+tamAlto*i;
    }


    topeApertura=ancho;
    velApertura=10;
    tiempoApertura=6;
    umbralIngreso=100;
    alpha= 150;
  }


  Frontera (float umbralIngreso_)
  {

    rectMode(CORNERS);

    ancho=width/20;
    tamAlto= height/cant;

    for (int i =0; i < a.length; i++)
    {
      a[i]=width/2;
      b[i]=tamAlto*i;
      c[i]=a[0]+ancho;
      d[i]=tamAlto+tamAlto*i;
    }


    topeApertura=ancho;
    velApertura=5;
    tiempoApertura=6;
    umbralIngreso=umbralIngreso_;
    alpha= 150;
  }



  void dibuja() 
  {
    pushStyle();
    stroke(0);
    fill(farbe, alpha);
    for (int i =0; i < a.length; i++)
    {
      rect(a[i], b[i], c[i]-apertura[i], d[i]);
    } 
    popStyle();
  }

  void comportamiento(int cual, boolean abre_)
  {

    if (abre_ && apertura[cual]<topeApertura)
    {
      apertura[cual]+=velApertura;
    }
    if (!abre_ && apertura[cual]>0)
    {
      apertura[cual]-=velApertura;
    }

    //     abierto= (apertura[i]>topeApertura/2 ? true:false);//no se usa

    //  println(apertura+"____"+abierto);
  }

  void evaluaIngresante(float evaX_, float evaY_, boolean condicionColor)
  {
    for (int i =0; i < a.length; i++)
    {
      disty[i]= dist(evaX_, evaY_, c[i], d[i]/2);

      if (disty[i]<umbralIngreso && condicionColor)
      {
        comportamiento(i, true);
        permitePaso[i]=true;
      } else
      {
        comportamiento(i, false);
        permitePaso[i]=false;
      }
    }
  }

  /////////////////
  //R E I N I C I O
  /////////////////
  void reinicio()
  {
  }


  //--------------------------------------------v    _S e t t e r s
  /*
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
   
   void setRechazo(float a_)
   {
   a+=a_;
   }
   
   void setMov(float mov_)
   {
   d=mov_;
   }
   */
  void setAlpha(int alpha_)
  {
    alpha= alpha_;
  }

  //--------------------------------------------v    _G e t t e r s

  float []  getA()
  {
    return a;
  }
  float []  getB()
  {
    return b;
  }  
  float []  getC()
  {
    return c;
  }  
  float []  getD()
  {
    return d;
  }


  /*
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
   
   float getDistyApertura()
   {
   return distyApertura;
   }
   */
  float getUmbral()
  {
    return umbralIngreso;
  }


  float [] getDisty()
  {
    return disty;
  }

  boolean [] getPermitePaso()
  {
    return permitePaso;
  }

  int getAlpha()
  {
    return alpha;
  }
}//cierra class frontera
