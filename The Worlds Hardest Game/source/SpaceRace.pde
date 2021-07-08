int gemiX = 420; 
int gemiY = 860;

PImage imgBulletSag;
PImage imgBulletSol;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();

int c = 0;

boolean gameWon = false;

public void setup(){
  size(900,900);
  imgBulletSag = loadImage("bullet_sag.png");
  imgBulletSol = loadImage("bullet_sol.png");
  
}
public void draw(){
  background(0);
  fill(0,255,0,50);
  rect(0,800,900,100);
  if(c%20 == 0){
      Bullet bullet = new Bullet(int(random(200)),int(random(2)),int(random(770)));
      bullets.add(bullet);
  }
  
  if(!gameWon){
    fill(255,255,255);
    rect(gemiX,gemiY,30,30);
  
  
    for(int i = 0;i<bullets.size();i+=1){  
        if(bullets.get(i).yon == 0){
          bullets.get(i).x += 5;
        }
        if(bullets.get(i).yon == 1){
          bullets.get(i).x -= 5;
        }  
    }
  
  
    for(Bullet bullet: bullets){
      if(bullet.x<0 || bullet.x>840){
        bullet.yon = int(random(2));
        if(bullet.yon == 0){
          bullet.x = 0;
        }
        if(bullet.yon == 1){
          bullet.x = 840;
        }
        bullet.y = int(random(770));
      }
      else{
        bullet.show();
      }    
    }
    
    for(Bullet bullet:bullets){
      if(( (gemiY<=bullet.y+30 && gemiY>=bullet.y) || (gemiY+30<=bullet.y+30 && gemiY+30>=bullet.y) ) &&
        ( (gemiX<=bullet.x+60 && gemiX >= bullet.x) || (gemiX+30<=bullet.x+60 && gemiX+30 >= bullet.x) )){
          gemiX = 420; 
          gemiY = 860;
      }
    }
  
    if(gemiY == 0){
      gameWon = true;
    }
  
    if(c<=600){
      c+=2;
    }
    else{
      c = 612;
    }
  }else{
    fill(255,255,255);
    textSize(50);
    text("You Won!\nPress 'r' to Restart",250,400);
  }
}
  
 


public void keyPressed(){  
  if(keyCode == UP && gemiY >= 5){
    gemiY -= 5;
  }
  if(keyCode == DOWN && gemiY<=865){
    gemiY += 5;
  } 
  if(keyCode == LEFT && gemiX >= 5){
    gemiX -= 5;
  }
  if(keyCode == RIGHT && gemiX<=865){
    gemiX += 5;
  }
  if(key == 'r' || key == 'R'){
    gameWon = false;
    gemiX = 420; 
    gemiY = 860;
  }
}
