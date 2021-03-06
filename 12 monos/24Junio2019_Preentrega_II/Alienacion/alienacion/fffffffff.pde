class Zona {
  int posDef;
  int tam;
  int radio;  
  color fondo;  

  int posA ;
  int posB ; 
  int posC ;
  int posD ;

  int posE ;
  int posF ;
  int posG ;
  int posH ;

  int posI;
  int posJ;
  int posK;
  int posL;  

  int posellipseA;
  int posellipseB;
  int posellipseC;



  String estadoA;
  String estadoB;
  String estadoC;


  Zona () {

    fondo = color(230);
    tam = 100;    
    radio = tam/2;
    posDef = -tam;   

    posellipseC = width;
    posI = width + tam + tam/2;
    posJ = width + tam/2;
    posK = width - tam/2;
    posL = width + tam/2;

    posellipseB = width+tam;
    posE = width + tam*2 + tam/2;
    posF = width + tam + tam/2 ;
    posG = width + tam/2 ;
    posH = width + tam/2 +tam;

    posellipseA= width+tam*2;
    posA = width + tam*3 + tam/2;
    posB = width + tam*2 + tam/2 ;   
    posC = width + tam*2 -tam/2 ;
    posD = width + tam*2 + tam/2;
  }

  void dibujar () {

    fondiu();

    fill (170, 100);
    rect (width/2, height/2, width, 140);

    // primer sector
    fill (140, 12, 0, 100);      
    quad (posA, 0, posB, 0, posC, height/2, posD, height/2);
    quad (posA, height, posB, height, posC, height/2, posD, height/2);

    // segundo sector
    fill (80, 80, 80, 100);    
    quad (posE, 0, posF, 0, posG, height/2, posH, height/2);  
    quad (posE, height, posF, height, posG, height/2, posH, height/2); 

    // tercer sector
    fill (1, 153, 150, 100);    
    quad (posI, 0, posJ, 0, posK, height/2, posL, height/2);
    quad (posI, height, posJ, height, posK, height/2, posL, height/2);


    fill (140, 12, 0, 70);
    ellipse (posellipseA, height/2, tam, tam);      

    fill (80, 80, 80, 70);
    ellipse (posellipseB, height/2, tam, tam);  

    fill(1, 153, 150, 70);
    ellipse (posellipseC, height/2, tam, tam);


    //ellipse del centro

    fill (255, 100, 5); 
    ellipse (width/2, height/2, tam, tam);
  }

  void fondiu()
  {
    pushStyle();
    rectMode(CORNER);
    fill(fondo, 100);
    rect(0, 0, width, height);
    popStyle();
  }


  void mover () {    

    if ( posI > posDef && posJ > posDef && posK >  posDef && posL > posDef && posellipseC > posDef)
    posellipseC -=5;
    posI -=5 ;
    posJ -=5 ; 
    posK -=5 ;  
    posL -=5 ; 
    estadoC = "reinicioC";

    if ( posE > posDef*2 && posF > posDef*2 && posG >  posDef*2 && posH > posDef*2 && posellipseB >posDef*2) 
      posellipseB -=5 ;
    posE -=5 ; 
    posF -=5 ;  
    posG -=5 ;  
    posH -=5 ;      
    estadoB = "reinicioB"; 


    if ( posA > posDef*4 && posB > posDef*4 && posC >  posDef*4 && posD > posDef*4 && posellipseA > posDef*4) 
      posellipseA -=5;
    posA -=5 ;
    posB -=5 ; 
    posC -=5 ;  
    posD -=5 ;
    estadoA = "reinicioA";
  }


  // actuliza estado C
  void actualizarC() {     
    if ( estadoC.equals( "reinicioC" ) ) {           
      if ( posJ == posDef ) { 

        posI = width + tam + tam/2;
        posJ = width + tam/2;
        posK = width - tam/2;
        posL = width + tam/2;
        posellipseC = width;
        estadoC = "reinicioC";
       // fondo=238;
      }
    }
  }  



  void actualizarB() {
    // actuliza estado B      
    if ( estadoB.equals( "reinicioB" ) ) {          
      if ( posF == posDef ) {    

        posE = width + tam + tam/2;
        posF = width + tam/2; 
        posG = width - tam/2;
        posH = width + tam/2;  
        posellipseB= width;
        estadoB = "reinicioB";
       // fondo=238;
      }
    }
  } 


  void actualizarA() {

    // actualiza estado A
    if ( estadoA.equals( "reinicioA" ) ) {

      if ( posB == posDef) {          
        posA = width + tam + tam/2;
        posB = width + tam/2;   
        posC = width - tam/2;
        posD = width + tam/2; 
        posellipseA= width;
        estadoA = "reinicioA";
       // fondo=238;
      }
    }
  } 

  void cambiaColorA() {
    float distanciaCentro = dist (width/2, height/2, posellipseA, height/2);
    println (distanciaCentro);   

    if (distanciaCentro  <=  radio  ) {
      fondo = color (140, 12, 0, 20);
    }
  }

  void cambiaColorB() {
    float distanciaCentro = dist (width/2, height/2, posellipseB, height/2);

    if (distanciaCentro <=  radio) {
      fondo = color (80, 80, 80, 20);
    }
  }
  void cambiaColorC() {
    float distanciaCentro = dist (width/2, height/2, posellipseC, height/2);    
    if (distanciaCentro <= radio  ) {
      fondo = color (1, 153, 150, 20);
    }
  }
}   
