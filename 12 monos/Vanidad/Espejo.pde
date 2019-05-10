class Espejo
{
  float tx, ty, tz, rx, ry, rz;
  float tam;
  boolean control= false;
  Espejo()
  {
    tx=0;
    ty=0;
    tz=10;
    rx=0;
    ry=50;
    rz=0;

    tam=0;
  }

  Espejo(float tx_, float ty_, float tz_, float rx_, float ry_, float rz_)
  {
    tx=tx_;
    ty=ty_;
    tz=tz_;
    rx=rx_;
    ry=ry_;
    rz=rz_;

    tam=0;
  }


  void dibuja()
  {

    pushMatrix();  
    rotateY(radians(ry));
    fill(0);
    rect(0, 0, width, height);
    translate(tx, ty, tz+1);
    fill(255);
    ellipse(width/2, height/2, 100+tam, 100+tam);
    popMatrix();
  }

  void setTam(String narciso_)
  {
    if (narciso_=="crece" && control==false) {
      tam+=10;
      control= true;
    }
    if (narciso_== "nada")
    {
      control=false;
    }
  }

  float getTam()
  {
    return tam;
  }


  void keyPressed()
  {

    if (key == 'q') 
    {
      tam-=10;
    }

    if (key == 'e') 
    {
      tam+=10;
    }
  }
}// cierra class Espejo
