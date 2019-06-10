class Individue
{


  float px, py, tam;
  float paso, topeMin, topeMax;
  color c=color(0, 0, 0, 0);
  PImage primitivo;
  PGraphics primitivo_;
  int tipoPrimitivo;

  Individue ()
  {
    px=width/2;
    py= height/2;
    tam= 100;
    paso=1;
    topeMax=tam*2;
    topeMin=tam/2;
  }

  Individue (float px_, float py_, float tam_)
  {
    px=px_;
    py=py_;
    tam=tam_;
  }

  Individue(int tamPGx_, int tamPGy_, int tipoPrimitivo_, int posX_, int posY_, int tam_, color c_)
  {
    disenoPrimitivo(tamPGx_, tamPGy_, tipoPrimitivo_, posX_, posY_, tam_, c_);
  }

  void dibuja()
  {
    comportamiento();
    fill(c);
    ellipse(px, py, tam, tam);
  }

  void dibujaDos()
  {
    comportamientoDos();

    dibujaPrimitivo();
   // imageMode(CENTER);
    fill(c);
    image(primitivo, 0, 0);
  }

  void disenoPrimitivo(int tamPGx_, int tamPGy_, int tipoPrimitivo_, int posX_, int posY_, int tam_, color c_)
  {
    primitivo_= createGraphics(tamPGx_, tamPGy_);      
    px=posX_;
    py=posY_;
    tam=tam_;
    c=c_;
    tipoPrimitivo=tipoPrimitivo_;
  }
  void dibujaPrimitivo()
  {

    if (tipoPrimitivo==0)//circulo
    {
      primitivo_.beginDraw ();
      primitivo_.fill(c);
      primitivo_.noStroke();
      primitivo_.ellipse(px, py, tam, tam);
      primitivo_.endDraw();
    }

    if (tipoPrimitivo==1)//triangulo
    {
      primitivo_.beginDraw ();
      primitivo_.fill(c);
      primitivo_.noStroke();
      primitivo_.triangle(px/2, py+py/2, px, py/2, px+px/2, py+py/2);
      primitivo_.endDraw();
    }

    if (tipoPrimitivo==2)//cuadrado
    {
      primitivo_.beginDraw ();
      primitivo_.fill(c);
      primitivo_.noStroke();
      primitivo_.rect(px, py, tam, tam);
      primitivo_.endDraw();
    }

    primitivo= primitivo_;
  }


  void setPosicion(float px_, float py_)
  {
    px=px_;
    py=py_;
  }

  void setColor(float r_, float g_, float b_, float a_)
  {
    c=color(r_, g_, b_, a_);
  }

  void setTam(float tam_)
  {
    tam=tam_;
  }


  void getPosicion()
  {
  }



  void comportamiento()
  {

    if (tam<=topeMax && tam>=topeMin)
    {
      tam+=paso;
    }

    if (tam==topeMax || tam==topeMin)
    {
      paso*=-1;
    }    
    println(tam);
  }

  void comportamientoDos()
  {

    if (tam<=topeMax && tam>=topeMin)
    {
      tam+=paso;
    }

    if (tam==topeMax || tam==topeMin)
    {
      paso*=-1;
    }    
    println(tam);
  }
}//class Individue
