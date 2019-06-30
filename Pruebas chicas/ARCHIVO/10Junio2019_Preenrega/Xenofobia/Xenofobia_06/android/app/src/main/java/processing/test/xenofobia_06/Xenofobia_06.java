package processing.test.xenofobia_06;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Xenofobia_06 extends PApplet {

Mundo m;
public void setup()

{
  //size (1400, 600);
  ///---------------------
  
  orientation(LANDSCAPE);
  ///---------------------
  m= new Mundo();
  noStroke();
}


public void draw ()

{

  m.dibuja();
}

public void mousePressed()
{
  m.mousePressed();
}

public void mouseReleased()
{
  m.mouseReleased();
}
class BolitaReactiva
{

  int [] farbe= new int []{
    color(255, 100, 5), 
    color(140, 12, 0), 
    color(255, 24, 1), 
    //color(30, 30, 30), 
    color(1, 153, 150), 
    color(68, 242, 238), 

  };
  int num, tam, pTam;
  float alpha=100;


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
    tam= PApplet.parseInt (random(10, 40));
    pTam=tam;
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=4;
    disty=0;

    umbral=10;

    pPosX=posX;
    pPosY=posY;
    noStroke();
  }



  BolitaReactiva(float px_, float py_, int tam_)
  {
    posX= px_;
    posY= py_;
    vel=0.2f;
    tam=tam_;
    pTam=tam;
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
    tam=PApplet.parseInt(random(tam_/2, tam_));
    pTam=tam;
    disty=0;

    umbral=5;

    pPosX=posX;
    pPosY=posY;
    movX=PApplet.parseInt(random(7, 11));
    movY=PApplet.parseInt(random(4, 5));
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
    tam= PApplet.parseInt (random(10, 40));
    pTam=tam;
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=vel_;
    disty=0;

    umbral=9;

    pPosX=posX;
    pPosY=posY;
    noStroke();
  }


  public void dibuja()

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



  public void setPosXY(float posX_, float posY_)
  {
    posX= posX_;
    posY=posY_;
  }

  public void setPosXYPrevia(float pPosX_, float pPosY_)
  {
    pPosX= pPosX_;
    pPosY=pPosY_;
  }
  public void setSumaPosXY(float posX_, float posY_)
  {

    posX+= posX_;
    posY+=posY_;
  }
  public void sumaPunto()
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

  public void regresaPrevio()
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


  public void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, posX, posY);
  }

  public void evaluaDistanciaDos(float p1_, float p2_)

  {
    distyRegreso= dist(p1_, p2_, pPosX, pPosY);
  }
  public void evaluaAvance(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPunto();
  }

  public void evaluaRegreso() 
  {
    anguloRegreso = atan2( posY-pPosY, posX-pPosX );
    regresaPrevio();
  }

  public void tiempoSiesta()
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
      tam= PApplet.parseInt(random(10, 40));
      crono=0;

      despierta=true;
    }

    //    return crono;
  }



  public void comportamientoB()

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
  }

  public void comportamientoTam(boolean choca)
  {
    if (choca)
    {
      tam= tam/2;
    }
    if (tam< pTam && choca==false)
    {
      tam++;
    }
  }


  /////////////////
  //R E I N I C I O
  /////////////////
  public void reinicio()
  {
    posX=pPosX;
    posY=pPosY;

    limWInicial=plWini;
    limHInicial=plHini;
    limWFinal=plWfini;
    limHFinal=plHfini;   

    movX=PApplet.parseInt(random(5, 10));
    movY=PApplet.parseInt(random(2, 5));

    num=PApplet.parseInt(random(farbe.length));
    lugar=false;
  }


  //--------------------------------------------v    _S e t t e r s
  public void setVel(float vel_)
  {
    vel+=vel_;
  }

  public void setTam(int tam_)
  {
    tam=tam_;
  }

  public void setDespierta(boolean despierta_)
  {
    despierta= despierta_;
  }

  public void setLimitesNuevos(float limWIni_, float limHIni_, float limWFin_, float limHFin_)
  {
    limWInicial=limWIni_;
    limWFinal=limWFin_;

    limHInicial=limHIni_;
    limHFinal= limHFin_;
  }

  public void setLugar(boolean lugar_)
  {
    lugar=lugar_;
  }

  public void setNum(int num_)
  {
    num=num_;
  }

  public void setMovXY(float movX_, float movY_)
  {

    movX=movX_;
    movY=movY_;
  }

  //--------------------------------------------v    _G e t t e r s


  public float [] getPosXY()
  {
    float [] posXY= new float [] {posX, posY};
    return posXY;
  }

  public float [] getPPosXY()
  {
    float [] pPosXY= new float [] {pPosX, pPosY};
    return pPosXY;
  }

  public float getDisty()
  {
    //   println("distyyy____"+ disty+"distDosss____"+ distyRegreso);

    return disty;
  }

  public float getTam()
  {
    return tam;
  }

  public float getUmbral()
  {
    return umbral;
  }

  public float getVel()
  {
    return vel;
  }

  public float getCrono()
  {
    return crono;
  }

  public float getUmbralCrono()
  {
    return umbralCrono;
  }
  public boolean getDespierta() {

    return despierta;
  }

  public boolean getLugar()
  {
    return lugar;
  }

  public int getFarbe()
  {
    return farbe[num];
  }

  public int getFarbeSize()
  {
    return farbe.length;
  }

  public int getNum()
  {
    return num;
  }

  public float [] getMovDosXY()
  {

    float [] movDosXY={movDosX, movDosY}; 
    return  movDosXY;
  }
}
class Mundo
{

  ZonaColor zC;
  ZonaColor zCReact;
  BolitaReactiva b;

  int  tamBoli= 40;
  int    cantBoli=50;
  BolitaReactiva [] bb22= new BolitaReactiva[cantBoli];

  boolean cambiaComp[]= new boolean[cantBoli];

  float limA=width/2+width/3;
  float limB=0;
  float limC=width;
  float limD=height;


  Mundo()
  {
    zC=new ZonaColor(limA, limB, limC, limD, tamBoli*3);
    zCReact=new ZonaColor(limA-10, limB, limA, limD, tamBoli*3);

    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i]= new BolitaReactiva(tamBoli, random(tamBoli, height-tamBoli), PApplet.parseInt(random (tamBoli, tamBoli*2)), 0, 0, limA, limD);
      bb22[i].setNum(PApplet.parseInt (random( bb22[0].getFarbeSize())));
      cambiaComp[i]=false;
    }
  }


  public void dibuja()
  {
    zC.dibuja();
    setColorReactivo();
    zCReact.dibujaFrontera(zC.getInicio());

    compBolitaCompleja();
    comportamientoRechazo();
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i].dibuja();
    }

    println(zC.getInicio());
  }

  public void compBolitaCompleja()
  {
    comportamientoConfort();

    for (int i=0; i< bb22.length; i++ )
    {

      bb22[i].comportamientoB();

      if (bb22[i].getLugar()==false && zC.getInicio()==false)
      {
        zC.evaluaIngresante(bb22[i].getPosXY()[0], bb22[i].getPosXY()[1], getCondicionColorCompleja()[i]);
      }
      if (zC.getPermitePaso() && bb22[i].getLugar()==false )
      {
        bb22[i].setLimitesNuevos(0, 0, zC.getPosTam()[2], zC.getPosTam()[3]);
      }
      if (bb22[i].getPosXY()[0]>zC.getPosTam()[0]+bb22[i].getTam()*2)
      {
        bb22[i].setLimitesNuevos(zC.getPosTam()[0], zC.getPosTam()[1], zC.getPosTam()[2], zC.getPosTam()[3]);
        bb22[i].setLugar(true);
      }
    }
  }

  public void comportamientoConfort()
  {

    for (int i=0; i< bb22.length; i++ )
    {
      if (bb22[i].getLugar() && cambiaComp[i]==false)
      {
        bb22[i].setMovXY(  2, 1);
        cambiaComp[i]=true;
      }
    }
  }

  public void comportamientoRechazo()
  {
    for (int i=0; i< bb22.length; i++ )
    {
      //   println (bb22[i].getTam()+"_____"+zC.getEvaluaDistyNEW(bb22[i].getPosXY()[0]+(bb22[i].getTam()/2), bb22[i].getPosXY()[1], bb22[i].getPosXY()[1]));
      if (getCondicionColorCompleja()[i]==false && bb22[i].getLugar()==false)
      {
        if (zC.getEvaluaDistyNEW(bb22[i].getPosXY()[0]+(bb22[i].getTam()/2), bb22[i].getPosXY()[1], bb22[i].getPosXY()[1])<bb22[i].getTam()/3)
        {
          bb22[i].comportamientoTam(true);
        } else
        {
          bb22[i].comportamientoTam(false);
        }
      }
    }
  }

  public void setColorReactivo()
  {
    zCReact.setZonaColor(zC.getNum());
  }
  ////////////////////////////////
  //R E I N I C I O  G E N E R A L
  ////////////////////////////////
  public void reinicioGeneral()
  {
    // f.reinicio();
    for (int i=0; i< bb22.length; i++ )
    {
      if (!getCondicionColorCompleja()[i] && bb22[i].getLugar()==true ) {
        bb22[i].reinicio();
      }
      cambiaComp[i]=false;
    }
  }
  //--------------------------------------------v    _G e t t e r s

  public boolean getCondicionColor()

  {
    boolean condicionColor_= (b.getFarbe() == zC.getFarbe()? true:false);
    return condicionColor_;
  }

  public boolean []getCondicionColorCompleja()

  {
    boolean [] condicionColor_= new boolean [bb22.length];
    for (int i=0; i< bb22.length; i++ )
    {
      condicionColor_[i]= (bb22[i].getFarbe() == zC.getFarbe()? true:false);
    }
    return condicionColor_;
  }


  public void mousePressed ()
  {

    zC.mousePressed();
    if (zC.getInicio()==false)
    {   
      reinicioGeneral();
    }
    zCReact.setAlpha(200);
  }

  public void mouseReleased()
  {
    zCReact.setAlpha(40);
    ;
  }
}//cierra class Mundo
class ZonaColor
{
  int [] farbe= new int []{
    color(255, 100, 5), 
    color(140, 12, 0), 
    color(255, 24, 1), 
    // color(30, 30, 30), 
    color(1, 153, 150), 
    color(68, 242, 238), 

  };

  int cFondo= 238;

  float alpha;
  float pw, px, py, pz;
  float disty, umbralIngreso;
  boolean permitePaso;

  int num;

  boolean inicio= true;

  ZonaColor()
  {
    rectMode(CORNERS);
  }

  ZonaColor(float pw_, float px_, float py_, float pz_, float umbralIngreso_)
  {
    rectMode(CORNERS);
    pw=pw_;
    px=px_;
    py=py_;
    pz=pz_;

    num=0;
    alpha= 10;


    umbralIngreso=umbralIngreso_;
  }  

  ZonaColor(float pw_, float px_, float py_, float pz_)
  {
    rectMode(CORNERS);
    pw=pw_;
    px=px_;
    py=py_;
    pz=pz_;

    num=0;
    alpha= 80;
  } 
  public void dibuja()
  {

    fondo();

    pushStyle();
    condicionInicial();
    popStyle();
  }

  public void dibujaFrontera(boolean inicio_)
  {
    if (inicio_==false)
    { 
      pushStyle();

      fill (farbe[num], alpha);
      rect(pw, px, py, pz);
      popStyle();
    }
  }
  public void fondo()
  {
    pushStyle();
    fill(238, 10);
    rect(0, 0, width, height);
    popStyle();
  }


  public void condicionInicial()
  {
    if (inicio)
    {
      pushStyle();

      fill (30, 30, 30, alpha);
      rect(pw, px, py, pz);
      popStyle();
    } else
    {

      pushStyle();
      fill (farbe[num], alpha);
      rect(pw, px, py, pz);
      popStyle();
    }
  }

  public void evaluaIngresante(float evaX_, float evaY_, boolean condicionColor)
  {


    if (condicionColor)
    {
      permitePaso=true;
    } else
    {
      permitePaso=false;
    }
  }

  public void setZonaColor(int num_)
  {
    num=num_;
  }

  public void setAlpha(float alpha_)

  {
    alpha= alpha_;
  }


  public void setPosTam(float pw_, float px_, float py_, float pz_)
  {
    pw=pw_;
    px=px_;
    py=py_;
    pz=pz_;
  }

  public float []  getPosTam()
  {
    float [] zona= new float[4];
    zona[0]=pw;
    zona[1]=px;
    zona[2]=py;
    zona[3]=pz;
    return zona;
  }

  public int getFarbe()
  {
    return farbe[num];
  }

  public int getNum()
  {
    return num;
  }

  public boolean getInicio()
  {
    return inicio;
  }

  public boolean getPermitePaso()
  {
    return permitePaso;
  }

  public float getDisty()
  {
    return disty;
  }


  public float  getEvaluaDistyNEW(float evaX_, float evaY_, float destinoY_)
  {
    float distyNEW= dist(evaX_, evaY_, pw, destinoY_);
    return distyNEW;
  }

  public void mousePressed ()
  {    
    if (mousePressed && mouseX<py && mouseX>pw)
    {
      alpha=10;

      if (inicio==true)
      {
        inicio=false;
      }
      if (inicio==false)
      {

        num= ( num<farbe.length-1? num+=1 : 0 );
      }
    } else
    {
      alpha=200;
    }
  }
}//cierra class ZonaColor
  public void settings() {  fullScreen(); }
}
