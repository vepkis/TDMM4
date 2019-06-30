class Circulo{
  
int radio,px,py;
color col;


  Circulo(int px_,int py_,int ra, color c){
   px=px_;
   py=py_;
   radio=ra;
   col=c;
       
  }  
  
  
 void dibujar(){ 
  fill(col);
  ellipse(px,py,radio*2,radio*2);
  
 } 
  
  
 void mover(int x, int y){ 
  px=x;
  py=y;
 }
  
void incRadio(){
 radio = radio + 30; 
}  
  
  
  
 void decRadio(){
 radio = radio - 30; 
}  
  

   
  
int radio(){  
 return radio; 
} 

int posX(){
 return px; 
}  

int posY(){
 return py; 
}  

}
