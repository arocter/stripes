stripe a,b;
stripe[] lines = new stripe[width*4+200];
int set=1;

void setup(){
  size(500,700);
  //a = new stripe(width/2);
  //b = new stripe(width/2-100);
  for (int i = 0; i < width+10; i+=10) {
    lines[i] = new stripe(i);
  }
  smooth();
}

void draw(){
  background(255);
  for (int i = 0; i < width+10; i+=10) {
    lines[i].display(); 
    lines[i].stripewidth();
    if(set==1){
    lines[i].move();
    }
  }
}

void mouseClicked() {
  if(set==1){
    set=0;
  }else{
    set=1;
  }
}