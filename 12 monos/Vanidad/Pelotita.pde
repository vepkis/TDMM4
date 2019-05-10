class Pelotita
{
  float tx, ty, tz, rx, ry, rz;

  float tam, movPelotita=20, comodin=-1 ;
  float mappy, disty;
  color farbe;


  Pelotita()
  {
    tx=width/2;
    ty=height/2;
    tz=3;
    rx=0;
    ry=50;
    rz=0;


    tam=10;
    farbe= color(255, 100, 0, 255);
  }

  Pelotita(float tx_, float ty_, float tz_, float rx_, float ry_, float rz_, float tam_)
  {
    tx=tx_;
    ty=ty_;
    tz=tz_;
    rx=rx_;
    ry=ry_;
    rz=rz_;

    tam=tam_;
    farbe= color(255, 100, 0, 255);
  }


  void dibuja()
  {
    pushMatrix();
    rotateY(radians(ry));

    translate(tx, ty, tz+movPelotita);
    fill(farbe);
    sphere(tam);

    //float distyNucleo= dist (tx, ty, (tz+movPelotita)+tam/2, tx, ty, mappy );
    popMatrix();

    //  println( mappy+"____"+disty);
  }


  void setMovimiento(String direccion) //direccion 0,1,2
  {
    if (direccion=="retrocede") {
      movPelotita+=2;
    }
    if (direccion=="avanza") {
      movPelotita-=2;
    }
    if (direccion=="nada") {
      movPelotita= movPelotita;
    }


    println(direccion+"___"+movPelotita);
  }

  void setMovimiento(float mx_) 
  {
    mappy= map(mx_, (width/2)-ry, width, 0, (75*width)/100);
    disty= dist(0, height/2+mappy, tz+tam+mappy, 0, mouseX, tz+tam+movPelotita);

    if (mappy>tam && mappy<(75*width)/100) {
      movPelotita=mappy;
    }

    println(tz+movPelotita);// el valor que uede tener para trigger 14, recuerda que tz vale 3 y tam 10
  }

  float getMovPelotita()
  {
    return(movPelotita+tz);
  }

  float getTam()
  {
    return tam;
  }

  color getFarbe()
  {
    return farbe;
  }
  void mouseDragged()
  {
    setMovimiento(mouseX);
  }

  void keyPressed ()

  {
    //a modo de test


    if (key == 'i' && movPelotita> -2) 
    {
      setMovimiento("avanza");
    } 

    if (key == 'o') 
    {
      setMovimiento("nada");
    } 

    if (key == 'p' && movPelotita<300) 
    {
      setMovimiento("retrocede");
    }

    println(key);
  }
}// termina clase pelotita
