class stripe{
  float topY=height+5;
  float btmY=-5;
  //float topstep=random(1,5);
  //float btmstep=random(1,5);
  //final
  //float topstep=random(5,10);
  //float btmstep=random(5,10);
  //float topstep=random(3,10);
  //float btmstep=random(3,10);
  //perlin noise
  float btmnoise=random(mouseY+100)*10;
  float topnoise=random(height-mouseY-100)*10;
  float stepspeed=50;
  float topstep=noise(topnoise)*stepspeed;
  float btmstep=noise(btmnoise)*stepspeed;
  float r=random(255);
  float g=random(255);
  float b=random(255);
  //float r,g;
  float r2=255-r;
  float g2=255-g;
  float b2=255-b;
  float alpha=150;
  //float alpha=100;
  float gap;
  //float gaprange=random(50,100);
  float gaprange=10;
  int direction=1;
  float linex;
  float strkweight=5;
  int colorset;
  
  stripe(float templinex){
    linex=templinex;
    //r=tempr;
    //g=tempg;
    //b=tempb;
  }
  
  void display(){
    blendMode(MULTIPLY);
    strokeWeight(strkweight);
    //strokeWeight(10);
    strokeCap(SQUARE);
    stroke(r,g,b,alpha);
    line(linex,-5,linex,topY);
    stroke(r2,g2,b2,alpha);
    line(linex,height+5,linex,btmY);

    if(colorset==1){
      r=noise(random(100))*10;
      r2=255-r;
    }
    if(colorset==2){
      g=noise(random(100))*10;
      g2=255-g;
    }
    if(colorset==3){
      b=noise(random(100))*10;
      b2=255-b;
    }
  }

  void move(){
    if(set==1){
      gap=topY-btmY;
      if(direction==1){
        topY-=topstep;
        btmY+=btmstep;
      }
      if(direction==0){
        topY+=topstep;
        btmY-=btmstep;
      }
      //println(r,g,b);
      if(gap<gaprange){
        direction=0;
      }
      if(btmY<-5 && topY>height+5){
        direction=1;
        switch(colorset){
          case 1:
          r=noise(random(100))*10;
          r2=255-r;
          break;
          case 2:
          g=noise(random(100))*10;
          g2=255-g;
          case 3:
          b=noise(random(100))*10;
          b2=255-b;
          case 4:
          r=random(255);
          g=random(255);
          b=random(255);
          r2=255-r;
          g2=255-g;
          b2=255-b;
        }
        r=random(255);
        g=random(255);
        b=random(255);
        r2=255-r;
        g2=255-g;
        b2=255-b;
        //gaprange=random(50,100);
        gaprange=10;
        //topstep=height-mouseY;
        //btmstep=mouseY;
      }
      if(key=='q' && btmY<-5){
        //println(r);
        colorset=1;
      }
      if(key=='w' && btmY<-5){
        colorset=2;
      }
      if(key=='e' && btmY<-5){
        colorset=3;
      }
      if(key=='r' && btmY<-5){
        colorset=4;
      }
    }
  }
  
  void stripewidth(){
      btmnoise=random(mouseY+100)*10;
      topnoise=random(height-mouseY-100)*10;
      topstep=noise(topnoise)*stepspeed;
      btmstep=noise(btmnoise)*stepspeed;
    if(keyPressed==true){
      if(key == CODED){
        if(keyCode==RIGHT){
          strkweight+=0.1;
        }
        if(keyCode==LEFT){
          strkweight-=0.1;
        }
        if(strkweight<=0){
          strkweight=0.1;
        }
        if(keyCode==UP){
          stepspeed+=(5/3);
        }
        if(keyCode==DOWN){
          stepspeed-=(5/3);
        }
        if(stepspeed<=0){
          stepspeed=1;
        }
        if(stepspeed>=200){
          stepspeed=200;
        }
      }
    }
  }
  
}