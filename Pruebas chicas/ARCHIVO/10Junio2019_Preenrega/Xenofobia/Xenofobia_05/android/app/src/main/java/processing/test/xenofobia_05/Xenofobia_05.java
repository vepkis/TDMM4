package processing.test.xenofobia_05;

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

public class Xenofobia_05 extends PApplet {

Mundo m;
public void setup()

{
  // size (1400, 600);
  ///---------------------
  
  orientation(LANDSCAPE);
  ///---------------------
  m= new Mundo();
  noStroke();
}


public void draw ()

{
  background(240);
  m.dibuja();
}

public void mousePressed()
{
  m.mousePressed();
}
class BolitaReactiva
{

  int [] farbe= new int []{
    color(200, 0, 0), 
    color(0, 200, 0), 
    color(0, 0, 200), 
    color(200, 200, 0), 
    color(200, 0, 200), 
    color(0, 200, 200)
  };
  int num, tam;
  float alpha=255;


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
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=4;
    disty=0;

    umbral=10;

    pPosX=posX;
    pPosY=posY;
    noStroke();
  }

  BolitaReactiva(float posX_, float posY_)
  {
    tam= PApplet.parseInt(random(10, 40));
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
    vel=0.2f;
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
    movX=PApplet.parseInt(random(8, 10));
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

    //   println("posX__"+posX+"______posY__"+posY+"______tam__"+tam);
    // println("movX=="+movX+"______posY=="+movY);

    println(vel);
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


    //    println("movX_"+movX+"__posX_"+posX);
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


  int farbe= color (0);
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



  public void dibuja() 
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

  public void comportamiento(int cual, boolean abre_)
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

  public void evaluaIngresante(float evaX_, float evaY_, boolean condicionColor)
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
  public void reinicio()
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
  public void setAlpha(int alpha_)
  {
    alpha= alpha_;
  }

  //--------------------------------------------v    _G e t t e r s

  public float []  getA()
  {
    return a;
  }
  public float []  getB()
  {
    return b;
  }  
  public float []  getC()
  {
    return c;
  }  
  public float []  getD()
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
  public float getUmbral()
  {
    return umbralIngreso;
  }


  public float [] getDisty()
  {
    return disty;
  }

  public boolean [] getPermitePaso()
  {
    return permitePaso;
  }

  public int getAlpha()
  {
    return alpha;
  }
}//cierra class frontera
class Mundo
{
  Frontera f;

  ZonaColor zC;
  BolitaReactiva b;
  // int cantBoli;

  int  tamBoli= 40;
  int    cantBoli=5;
  BolitaReactiva [] bb22= new BolitaReactiva[cantBoli];

  //  int tamBoli;

  boolean cambiaComp[]= new boolean[cantBoli];
  Mundo()
  {



    f= new Frontera(tamBoli*3);
    zC=new ZonaColor(f.getA()[0], f.getB()[0], width, height);
    //    b= new BolitaReactiva(random(tamBoli, f.getPuertas()[0][0]-tamBoli), random(tamBoli, height-tamBoli), random (10, tamBoli),0, 0, f.getPuertas()[0][0], height);
    // b= new BolitaReactiva(tamBoli, random(tamBoli, height-tamBoli), int(random (10, tamBoli)), 0, 0, f.getA()[0], height);
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i]= new BolitaReactiva(tamBoli, random(tamBoli, height-tamBoli), PApplet.parseInt(random (tamBoli, tamBoli*2)), 0, 0, f.getA()[0], height);
      bb22[i].setNum(PApplet.parseInt (random( bb22[0].getFarbeSize())));
      cambiaComp[i]=false;
    }
  }


  public void dibuja()
  {
    //    f.dibuja();
    zC.dibuja();
    //    compBolita();
    //    b.dibuja();
    compBolitaCompleja();
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i].dibuja();
    }
  }

  public void compBolitaCompleja()
  {
    comportamientoConfort();

    for (int i=0; i< bb22.length; i++ )
    {

      bb22[i].comportamientoB();

      if (bb22[i].getLugar()==false && zC.getInicio()==false)
      {
        f.evaluaIngresante(bb22[i].getPosXY()[0], bb22[i].getPosXY()[1], getCondicionColorCompleja()[i]);
      }    
      for (int h=0; h< f.getA().length; h++ )
      {
        if (f.getPermitePaso()[h] && bb22[i].getLugar()==false )
        {
          bb22[i].setLimitesNuevos(0, 0, zC.getPosTam()[2], zC.getPosTam()[3]);
        }
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
  }
}//cierra class Mundo
class ZonaColor
{
  int [] farbe= new int []{
    color(200, 0, 0), 
    color(0, 200, 0), 
    color(0, 0, 200), 
    color(200, 200, 0), 
    color(200, 0, 200), 
    color(0, 200, 200)
  };

  float alpha;
  float pw, px, py, pz;
  int num;

  boolean inicio= true;

  ZonaColor()
  {
    rectMode(CORNERS);
  }

  ZonaColor(float pw_, float px_, float py_, float pz_)
  {
    rectMode(CORNERS);
    pw=pw_;
    px=px_;
    py=py_;
    pz=pz_;

    num=0;
    alpha= 150;
  }  
  public void dibuja()
  {

    pushStyle();
    condicionInicial();
    popStyle();
  }

  public void condicionInicial()
  {
    if (inicio)
    {
      fill (0, alpha);
      rect(pw, px, py, pz);
    } else
    {
      fill (farbe[num], alpha);
      rect(pw, px, py, pz);
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

  public boolean getInicio()
  {
    return inicio;
  }

  public void mousePressed ()
  {    
    if (mousePressed && mouseX<py && mouseX>pw)
    {

      if (inicio==true)
      {
        inicio=false;
      }
      if (inicio==false)
      {

        num= ( num<farbe.length-1? num+=1 : 0 );
      }
    }
  }
}//cierra class ZonaColor
  public void settings() {  fullScreen(); }
}
