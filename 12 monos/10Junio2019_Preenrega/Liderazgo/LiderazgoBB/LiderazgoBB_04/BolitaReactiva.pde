class BolitaReactiva
{

  color [] farbe= new color []{
    color(200, 0, 0), 
    color(0, 200, 0), 
    color(0, 0, 200), 
    color(200, 200, 0), 
    color(200, 0, 200), 
    color(0, 200, 200)
  };
  int num, tam;
  float alpha=150;


  float posX, posY, pPosX, pPosY;
  float movX, movY, movDosX, movDosY, limWInicial, limWFinal, limHInicial, limHFinal, plWini, plHini, plWfini, plHfini;

  float angulo, anguloRegreso;
  float vel, disty, distyRegreso, dir, umbral;
  int crono, umbralCrono=4;
  boolean despierta= true;

  // String lugar= "izq";
  boolean lugar;

  BolitaReactiva()
  {
    tam= int (random(20, 40));
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=3;
    disty=0;

    umbral=10;

    pPosX=posX;
    pPosY=posY;
    noStroke();
  }

  BolitaReactiva(float posX_, float posY_)
  {
    tam= int(random(10, 40));
    posX=posX_;
    posY=posY_;
    vel=4;
    disty=0;

    umbral=5;


    pPosX=posX;
    pPosY=posY;
    noStroke();
  }

  BolitaReactiva(float px_, float py_, int tam_)
  {
    posX= px_;
    posY= py_;
    vel=0.2;
    tam=tam_;
    disty=0;

    umbral=5;

    pPosX=posX;
    pPosY=posY;
    movX=8;
    movY=6;

    limWInicial=0;
    limHInicial=0;
    limWFinal=width/2;
    limHFinal= height;    

    plWini=limWInicial;
    plHini=limHInicial;
    plWfini=limWFinal;
    plHfini=limHFinal;

    lugar=false;
    noStroke();
  }

  BolitaReactiva(float px_, float py_, int tam_, float limWinicial_, float limHinicial_, float limWFinal_, float limHFinal_)
  {
    posX= px_;
    posY= py_;
    tam=tam_;
    disty=0;

    umbral=5;

    pPosX=posX;
    pPosY=posY;
    movX=int(random(8, 10));
    movY=int(random(4, 5));
    movDosX= movX/3;
    movDosY= movY/3;
    limWInicial=limWinicial_;
    limHInicial=limHinicial_;
    limWFinal=limWFinal_;
    limHFinal= limHFinal_;

    plWini=limWInicial;
    plHini=limHInicial;
    plWfini=limWFinal;
    plHfini=limHFinal;

    lugar=false;

    noStroke();
  }

  BolitaReactiva(float vel_)
  {
    tam= int (random(10, 40));
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=vel_;
    disty=0;

    umbral=9;

    pPosX=posX;
    pPosY=posY;
    noStroke();
  }


  void dibuja()

  {
    pushStyle();
    if (despierta)
    {
      fill(farbe[num], alpha);
      ellipse(posX, posY, tam, tam);
    } else {
      tiempoSiesta();
    }
    popStyle();
  }



  void regresaPrevio()
  {

    if (distyRegreso>disty)
    {
      posX-=vel*cos(anguloRegreso);
    }
    if (distyRegreso>disty)
    {
      posY-=vel*sin(anguloRegreso);
    }
  }


  void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, posX, posY);
  }

  void evaluaDistanciaDos(float p1_, float p2_)

  {
    distyRegreso= dist(p1_, p2_, pPosX, pPosY);
  }
  void evaluaAvance(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPunto();
  }
  void evaluaAvanceABS(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPuntoABS();
  }

  void evaluaLugar(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPunto();
  }
  void evaluaRegreso() 
  {
    anguloRegreso = atan2( posY-pPosY, posX-pPosX );
    regresaPrevio();
  }

  void sumaPunto()
  {
    if (disty>umbral)
    {
      posX+=vel*cos(angulo);
    }
    if (disty>umbral)
    {
      posY+=vel*sin(angulo);
    }
  }

  void sumaPuntoABS()
  {
    if (abs(disty)>=umbral)
    {
      posX+=vel*cos(angulo);
    }
    if (abs(disty)>=umbral)
    {
      posY+=vel*sin(angulo);
    }
  }

  void tiempoSiesta()
  {

    if (frameCount%60 == 0)
    {
      crono+=1;
    }

    if (crono==umbralCrono)
    {
      posX=pPosX;
      posY=pPosY;
      vel=1;
      tam= int(random(10, 40));
      crono=0;

      despierta=true;
    }

    //    return crono;
  }



  void comportamientoB()

  {
    if ((posX<=limWFinal || posX>=limWInicial) && (posY <= limHFinal || posY>=limHInicial))
    {
      posX+=movX;
      posY+=movY;
    }
    if (posX>limWFinal-tam/2 || posX<limWInicial+tam/2)
    {
      movX*=-1;
    }
    if (posY>limHFinal-tam/2 || posY<limHInicial+tam/2)
    {
      movY*=-1;
    }


    //    println("movX_"+movX+"__posX_"+posX);
  }


  /////////////////
  //R E I N I C I O
  /////////////////
  void reinicio()
  {
    posX=pPosX;
    posY=pPosY;

    limWInicial=plWini;
    limHInicial=plHini;
    limWFinal=plWfini;
    limHFinal=plHfini;   

    movX=int(random(5, 10));
    movY=int(random(2, 5));

    num=int(random(farbe.length));
    lugar=false;
  }


  //--------------------------------------------v    _S e t t e r s



  void setPosXY(float posX_, float posY_)
  {
    posX= posX_;
    posY=posY_;
  }

  void setPosXYPrevia(float pPosX_, float pPosY_)
  {
    pPosX= pPosX_;
    pPosY=pPosY_;
  }
  void setSumaPosXY(float posX_, float posY_)
  {

    posX+= posX_;
    posY+=posY_;
  }

  void setVel(float vel_)
  {
    vel+=vel_;
  }

  void setTam(int tam_)
  {
    tam=tam_;
  }

  void setDespierta(boolean despierta_)
  {
    despierta= despierta_;
  }

  void setLimitesNuevos(float limWIni_, float limHIni_, float limWFin_, float limHFin_)
  {
    limWInicial=limWIni_;
    limWFinal=limWFin_;

    limHInicial=limHIni_;
    limHFinal= limHFin_;
  }

  //--------------------------------------------v    _S e t t e r s

  void setLugar(boolean lugar_)
  {
    lugar=lugar_;
  }

  void setNum(int num_)
  {
    num=num_;
  }

  void setMovXY(float movX_, float movY_)
  {
    movX=movX_;
    movY=movY_;
  }

  void setUmbral(float umbral_)
  {
    umbral=umbral_;
  }

  //--------------------------------------------v    _G e t t e r s


  float [] getPosXY()
  {
    float [] posXY= new float [] {posX, posY};
    return posXY;
  }

  float [] getPPosXY()
  {
    float [] pPosXY= new float [] {pPosX, pPosY};
    return pPosXY;
  }

  float getDisty()
  {
    //   println("distyyy____"+ disty+"distDosss____"+ distyRegreso);

    return disty;
  }

  float getTam()
  {
    return tam;
  }

  float getUmbral()
  {
    return umbral;
  }

  float getVel()
  {
    return vel;
  }

  float getCrono()
  {
    return crono;
  }

  float getUmbralCrono()
  {
    return umbralCrono;
  }
  boolean getDespierta() {

    return despierta;
  }

  boolean getLugar()
  {
    return lugar;
  }

  color getFarbe()
  {
    return farbe[num];
  }

  int getFarbeSize()
  {
    return farbe.length;
  }

  int getNum()
  {
    return num;
  }

  float [] getMovDosXY()
  {

    float [] movDosXY={movDosX, movDosY}; 
    return  movDosXY;
  }


  void mouseReleased ()
  {
    lugar= false;
  }
}