class Figuritas
{
  int  cant=3, num;
  float px, py, tam, tamClon;  
  PImage [] figurita_= new PImage [3];

  Figuritas()
  {
    figurita_[0] = loadImage("circle.png");
    figurita_[1] = loadImage("triangle.png");
    figurita_[2] = loadImage("rect.png");

    imageMode(CENTER);
    tam=200;
    tamClon=tam;
  }  

  Figuritas(float px_,float py_, float tam_)
  {
    figurita_[0] = loadImage("circle.png");
    figurita_[1] = loadImage("triangle.png");
    figurita_[2] = loadImage("rect.png");

    imageMode(CENTER);
    px=px_;
    py=py_;
    tam=tam_;
    tamClon=tam;
  } 
  
  void dibuja()
  {
    image(figurita_[num], px, py, tam, tam);
  }


  void setPXPY(float px_, float py_)
  {
    px= px_;
    py=py_;
  }
  void setTam(float tam_)
  {
    tam=tam_;
  }

  void setNum(int num_)
  {
    num=num_;
  }

  int getFiguritaSize()
  {
    return figurita_.length;
  }

  float getTam()
  {
    return tam;
  }

  float getTamClon()
  {
    return tamClon;
  }
}// cierra clase Figuritas
