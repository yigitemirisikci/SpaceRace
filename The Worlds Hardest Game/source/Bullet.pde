class Bullet{
  public int sayi;
  public int yon;
  public int x;
  public int y;
  
  public Bullet(int sayi ,int yon, int y){
    this.sayi = sayi;
    this. yon = yon;
    this.y = y;
    
    if(yon == 0){
      this.x = 0;
    }
    if(yon == 1){
      this.x = 840;
    }
  }
  
  public void show(){
    if(this.yon == 0){
      image(imgBulletSag,this.x,this.y,60,30);
    }
    if(this.yon == 1){
      image(imgBulletSol,this.x,this.y,60,30);
    }
  }
  
  



}
