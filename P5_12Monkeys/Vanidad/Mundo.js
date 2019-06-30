class Mundo
{

constructor(px_,py_, tam_)
{
 this.px= px_;
 this.py=py_;
 this.tam= tam_;
 
}

dibuja()
{
  fill(0,0,200);
  ellipse(this.px,this.py,this.tam,this.tam);
  
}

setPx(px_)
{
 this.px-=px_; 
}

getPx(){
 return this.px; 
}


}// cierra class mundo
