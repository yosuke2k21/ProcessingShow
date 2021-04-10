  int [][] Lights = new int [4][15]; 
  float x = 50.00;
  float y = 400.00;
  float p = 700.00;
  float q = 800.00;
  float a = 520.00;
  float b = 570.00;
  int X = 520;
  int i = 570;
  int j = 350;
  int selected = 0;

  void setup(){
    size(800,800);
    background(116,169,214);
    //電気の関数を初期化
    for(int x = 0;x < 4;x++){
      for(int y = 0;y < 15;y++){
        Lights[x][y] = 0;
      }
    }
  }
  
  void Line(int x,int X){
    for(int i = 0;i < 15;i++){
      line(x,i*20+50,X,i*20+70);
    }
  }
  
  void Line2(int x,int X){
    for(int i = 0;i < 15;i++){
      line(x,i*20+50,X,i*20+70);
    }
  }
  
  void Line3(int a,int b,int c){
    for(int i = 0;i < 10;i++){
      line(a-i*10,b+i*25,a-i*10,c+i*25);
    }
  }
  
  void Line4(int a,int b,int c){
    for(int i = 0;i < 15;i++){
      line(a+i*20,a+i*16,b+i*20,c+i*16);
    }
  }
  
  void Line5(int x,int y,int z){
    for(int i = 0;i < z;i++){
      line(x,i*20+350,y,i*20+350);
    }
  }
  
  void Line6(int x,int p){
    for(int i = 0;i < p;i++){
      line(i*50+x,350,i*50+x,800);
    }
  }
  
  void Line7(int a){
    for(int i = 0;i < 5;i++){
      line(i*50+a,430,i*50+a,450);
    }
  }
  
  void Window(int x,int y){
    for(int i = 0;i < 4;i++){
      for(int j = 0;j < 15;j++){
        rect(i*50+x,j*20+y,40,10);
      }
    }
  }
  
  
  void Window2(int a,int b,int c,int d,int e){
    for(int i = 0;i < e;i++){
      //看板のif文
      if(b == 550 && i == 0){
        fill(0);
      }else if(b == 550 && i == 1){
        fill(255,255,0);
      }else if(b == 550 && i == 2){
        fill(0,0,255);
      }else if(b == 550 && i == 3){
        fill(255);
      }else if(b == 550 && i == 5){
        fill(255,255,0);
      }
      rect(i*d+a,b,c,c);
    }
  }
  
  //マンションの端の部分
  void Quad(int a,int b){
    for(int i = 0;i < 15;i++){
      quad(a,i*20+50,a,i*20+70,b,i*20+90,b,i*20+70);
    }
  }
  
  //動く人
  void drawHuman(float x,float y){
    fill(255);  
    ellipse( x, y, 30, 30 );
    ellipse(x-7,y-6,10,10);
    ellipse(x+7,y-6,10,10);
    line( x, y+15, x, y+35 );
    line(x,y+20,x-10,y+35);
    line(x,y+20,x+10,y+35);
    line(x,y+35,x-10,y+50);
    line(x,y+35,x+10,y+50);
    ellipse(x,y+10,5,5);
    fill(0);
    ellipse(x-7,y-6,3,3);
    ellipse(x+7,y-6,3,3);
 }
 
 //エスカレーター
 void Escalator(int x,int X){
    for(int y = i;y >= 350;y = y-10){
      line(x,y,X,y);
      }
    i--;
    if(i == 560){
      i = 570;  
    }
  }
  
  void Escalator2(int x,int X){
    for(int y = j;y <= 570;y = y+10){
      line(x,y,X,y);
    }
    j++;
    if(j == 360){
      j = 350;
    }
  }
  
  //時計
  void drawClock(int x, int y, int r ){
    ellipse( x, y, r*2, r*2 );
    float kakudo_h= 2*PI*hour()/12.0 -PI/2;
    float kakudo_m= 2*PI*minute()/60.0 -PI/2;
    float kakudo_s= 2*PI*second()/60.0 -PI/2;
    float len_h= r*0.5;
    float len_m= r*0.7;
    float len_s= r*0.9;
    line( x, y, x+len_h*cos(kakudo_h), y+len_h*sin(kakudo_h) );
    line( x, y, x+len_m*cos(kakudo_m), y+len_m*sin(kakudo_m) );
    line( x, y, x+len_s*cos(kakudo_s), y+len_s*sin(kakudo_s) );
  }
  
  void draw(){
    stroke(0);
    strokeWeight(1);
    fill(231,232,226);
    //マンションの端の部分
    Quad(150,120);
    Quad(500,470);
    Quad(350,380);
    Quad(700,730);
    
    
    
    fill(242,202,170);
    //橋より下の部分
    quad(300,570,600,570,600,800,300,800);
    //中央より左の壁
    rect(0,350,300,450);
    //中央より右の壁
    rect(600,350,200,450);
    fill(255);
    //壁の横線
    Line5(0,600,45);
    Line5(600,800,45);
    //壁の縦線
    Line6(0,20);
    Line6(600,10);
    
    //マンションの部屋を描く
    fill(231,232,226);
    stroke(0);
    for(int i = 0;i < 4;i++){
      for(int j = 0;j < 15;j++){
        rect(i*50+150,j*20+50,50,20);
      }
    }
    for(int i = 0;i < 4;i++){
      for(int j = 0;j < 15;j++){
        rect(i*50+500,j*20+50,50,20);
      }
    }
    
    //部屋の窓
    fill(255);
    Window(505,55);
    //西武の窓
    fill(255,239,133);
    Window2(0,380,50,50,5);
    Window2(650,380,50,50,3);
    //西武の看板
    Window2(0,550,50,50,6);
    
    
    //西武につながる橋の部分
    stroke(226,159,167);
    fill(226,159,167);
    triangle(400,570,400,800,310,800);
    rect(400,570,150,230);
    triangle(550,570,550,800,800,800);
    triangle(550,570,800,800,800,775);
    
    //看板の文字
    fill(0);
    textSize(25);
    text("AURORA",130,470);
    text("Loft",50,585);
    textSize(20);
    fill(255);
    text("ZARA",0,585);
    textSize(18);
    text("ABC",255,575);
    text("MART",250,590);
    fill(255);
    text("LIBRO",100,585);
    textSize(13);
    fill(255,0,0);
    text("docomo",150,581);
    textSize(18);
    text("ABC",255,575);
    text("MART",250,590);
    fill(255,0,0);
    textSize(13);
    text("UNI",210,575);
    text("QLO",210,585);
    fill(0);
    textSize(45);
    text("MALL",125,520);
    textSize(50);
    text("SEIBU",650,520);
    
    
    //部屋の電気のon off
    stroke(0);
    for(int a = 0;a < 10;a++){
      int x = (int)random(4);
      int y = (int)random(15);
      Lights[x][y] = 1;
      for(int i = 0;i < 4;i++){
        for(int j = 0;j < 15;j++){
          if(Lights[x][y] == 1){
            fill(255,255,0);
            Lights[x][y] = 0; 
          }else{
            fill(255);
          }
            rect(i*50+155,j*20+55,40,10);
      }
    }
  }
    
    //人
    x++;
    drawHuman(x,y);
    if(x == 800){
      x = 0;
    }
    
    
    //壁の付け足し。人が中にいるように。
    fill(242,202,170);
    rect(0,430,250,20);
    rect(650,430,150,20);
    rect(250,370,50,80);
    rect(600,370,50,80);
    
    //壁の線の付け足し
    Line7(0);
    Line7(650);
    
    //時計の付近の壁
    fill(149,65,28);
    rect(300,350,300,100);
    
    //時計を描く
    fill(186,183,224);
    drawClock(450,400,45);
    //時計の数字
    fill(0);
    textSize(15);
    text("12",440,370);
    text("1",464,375);
    text("2",478,385);
    text("3",485,405);
    text("4",478,425);
    text("5",464,435);
    text("6",447,440);
    text("7",430,435);
    text("8",416,425);
    text("9",409,405);
    text("10",410,387);
    text("11",423,375);
    
    //壁の線の付け足し
    fill(255);
    Line5(250,300,5);
    Line5(600,650,5);
    
    //エスカレーター部分の背景
    stroke(50,204,18);
    fill(50,204,18);
    rect(300,350,80,220);
    
    //エスカレーターの描き
    fill(0);
    rect(305,350,25,220);
    rect(340,350,25,220);
    fill(0);
    stroke(255,255,0);
    strokeWeight(2);
    Escalator(340,365);
    Escalator2(305,330);
    
    //ダイエーと西武の看板
    stroke(188,200,219);
    strokeWeight(1);
    fill(188,200,219);
    rect(300,450,300,23);
    textSize(25);
    fill(255,79,25);
    text("daiei",350,470);
    fill(28,5,255);
    text("SEIBU",480,470);
    
    //ドア付近の背景
    fill(50,204,18);
    stroke(50,204,18);
    rect(520,350,80,100);
    rect(380,474,220,96);
    
    //ドアの描き
    fill(255,239,133);
    rect(465,500,70,70);
    fill(255);
    rect(465,500,35,70);
    rect(X-20,500,35,70);
    fill(200,200,50);
    ellipse(X+5,535,10,10);
    if(X < 485){
      X = 485;
    }
    if(X >= 520){
      X = 520;
    }
    
    //手すりの描き
    stroke(0);
    Line3(400,550,570);
    Line4(550,550,570);
    strokeWeight(4);
    line(550,550,800,750);
    line(400,550,300,800);
    //西武の枠
    strokeWeight(7);
    line(0,350,800,350);
    
    //橋を歩く人
    strokeWeight(1);
    //歩くスピード
    p = p - 0.3;
    q = q - 0.5;
    drawHuman(p,q);
    //人が戻る
    if(p <= 540.00){
      p = 700.00;
      q = 800.00;
      //ドアが開く
      X = 450;
    }
    
    if(p <= 620.00){
      //ドアが閉じる
      X = 520;
    }
    //歩くスピード 
    a = a - 0.1;
    b = b + 0.3;
    drawHuman(a,b);
    //人が戻る
    if(b >= 800.00){
      a = 520.00;
      b = 570.00;
    }
  }
 
  int field = 0;
  void mousePressed(){
    //昼か夜か
    field++; 
    if(field == 1){
      background(0);
    }else{
      background(116,169,214);  
    }
    if(field > 1){
      field = 0;
    }
  }
  
  
  
  

  
 
  
  
  
    

