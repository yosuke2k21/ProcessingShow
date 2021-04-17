
  ///////////  CG概論最終作品                  ////////////  
  ///////////  2620150583 2年3組23番 鈴木洋祐  ////////////
  
  /////////// ライブラリをインストールする！          //////////////
  /////////// スケッチ→インポート→minim, oscP5を検索 /////////////
    
    import ddf.minim.*;  //宣言
    import ddf.minim.effects.*;
    import oscP5.*;
    import netP5.*;
     
    Minim mini;    //Minimオブジェクト変数
    AudioPlayer[] player1 = new AudioPlayer [2];
    AudioPlayer[] player2 = new AudioPlayer [2];
  
    PImage img1, img2;
    
    // *******
    //  定義値
    // *******
    // 画面幅
    final int WINDOW_WIDTH = 1200;
    // 画面高さ
    final int WINDOW_HEIGHT = 500;
    
    // CENTER BOX定義
    final int CENTER_BOX_WIDTH = 240;
    final int CENTER_BOX_HEIGHT = 36;
    final int CENTER_BOX_DEPTH = 230;
    
    // SIDE BOX定義
    final int BOX_WIDTH = 200;
    final int BOX_HEIGHT = 36;
    final int BOX_DEPTH = 230;
    
    // ジョグ高さ
    final int JOG_HEIGHT = 8;
    final int JOG_WIDTH = 60;
    
    // デフォルトの描画高さ
    final int DEFAULT_HEIGHT = WINDOW_HEIGHT / 2 - BOX_HEIGHT / 2;
    
    void setup(){
      
      size(1200, 500, P3D);
      
      img1 = loadImage("arietty1.jpgarietty1.jpg");
      img2 = loadImage("chihiro1.jpg");
      
      boolean breakFlg = false;  //初期処理エラーFLG
  
      //Minimインスタンスを作成する
      mini = new Minim( this );
      
      //音楽制御用インスタンス、曲のファイルを読み込む
      player1[0] = mini.loadFile("Ivy Lab - -Teacup- E.P - 01 Teacup.mp3");
      player1[1] = mini.loadFile("Ivy Lab - -Teacup- E.P - 02 Dark Horse ft. Rocks FOE.mp3");
      player2[0] = mini.loadFile("Ivy Lab - -Teacup- E.P - 03 Gutted.mp3");
      player2[1] = mini.loadFile("Ivy Lab - -Teacup- E.P - 05 Together Plus Mute.mp3");
    }
   
    void draw(){
      background(220);
      fill(0);
      textSize(30);
      drawSongs1(50);
      drawSongs2((width*3/4));  
      
      pushMatrix();
      rotateX(radians(-40));
      translate(0, -100, 200);
      

      
      ////////// 左のBOX  ///////
      drawSideBox(width / 4);
      
      ////////// 右のBOX  ////////
      drawSideBox(width - width/4);
      
      
      /////////真ん中のBOX///////////
      drawCenterBox(width / 2);
      popMatrix();
      
    }
    
    void drawSongs1(int X){
      AudioMetaData meta = player1[h].getMetaData();
      String author = meta.author();
      String title = meta.title();
      text("Artist:" + author, X, height/6);
      text("Song:" + title, X, height/6 + 30);
    }
    
    void drawSongs2(int X){
      AudioMetaData meta = player2[i].getMetaData();
      String author = meta.author(); 
      String title = meta.title();
      text("Artist:" + author, X, height/6);
      text("Song:" + title, X, height/6 + 30);
    }
    
    int h = 0;
    int i = 0;
    
    void keyPressed(){
      //現在のゲイン値を取得する
      float myGain1 = player1[h].getGain();
      float myGain2 = player2[i].getGain();
      
      // 曲の再生停止処理
      switch(keyCode){
        case 'A':
          player1[h].play();
          player1[h].setGain(0.0);
          break;
        case 'S':
          player1[h].pause();
          break;
        case 'L':
          player2[i].play();
          player2[i].setGain(0.0);
          break;
        case 'K':
          player2[i].pause();
          break;
      }
      
      // クロスフェーダーの処理
      switch(keyCode){
      case RIGHT:
        if(  myGain1 >= -60.0 && X > 0){
          //player1[h]のMINまでゲインを下げる
          myGain1 = myGain1 - 6.0; 
        }
        if(  myGain2 <= 0.0 && X < 0){
          //player2[i]のMAXまでゲインを上げる
          myGain2 = myGain2 + 6.0; 
        }
        X = X + 3;
        break;
        
      case LEFT:
        if( myGain1 <= 0.0 && X > 0){
          //player1[h]のMAXまでゲインを上げる
          myGain1 = myGain1 + 6.0;
        }
        if( myGain2 >= -60.0 && X < 0){
          //player2[i]のMINまでゲインを下げる
          myGain2 = myGain2 - 6.0;
        }
        X = X - 3;
        break;
        
      case DOWN:
        h++;
        if(h > 1){
          h = 0;
        }
        break;
        
      case UP:
        i++;
        if(i > 1){
          i = 0;
        }
        break;
      }
      player1[h].setGain( myGain1 );
      player2[i].setGain( myGain2 );
    }
    
    float X = 0;
    
    void drawCenterBox(int centerX){
      pushMatrix();
      translate(centerX, height/2, 0);
      fill(255, 255, 255, 255);
      stroke(0);
      box(BOX_WIDTH, BOX_HEIGHT, BOX_DEPTH);
      popMatrix();
      
      //４つのプレイヤーのツマミ
      pushMatrix();
      translate(centerX - 35, DEFAULT_HEIGHT - 8, -80);
      fill(0);
      noStroke();
      pillar(8, 3, 3);
      translate(25, 0, 0);
      pillar(8, 3, 3);
      translate(25, 0, 0);
      pillar(8, 3, 3);
      translate(25, 0, 0);
      pillar(8, 3, 3);
      popMatrix();
      
      //ゲインのツマミ
      pushMatrix();
      translate(centerX - 35, DEFAULT_HEIGHT - 8, -65);
      fill(100);
      noStroke();
      pillar(8, 3, 3);
      translate(25, 0, 0);
      pillar(8, 3, 3);
      translate(25, 0, 0);
      pillar(8, 3, 3);
      translate(25, 0, 0);
      pillar(8, 3, 3);
      popMatrix();
      
      //EQ highつまみ
      pushMatrix();
      translate(centerX - 35, DEFAULT_HEIGHT - 8, -50);
      fill(0);
      noStroke();
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      popMatrix();
      
      //EQ midつまみ
      pushMatrix();
      translate(centerX - 35, DEFAULT_HEIGHT - 8, -35);
      fill(0);
      noStroke();
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      popMatrix();
      
      //EQ lowつまみ
      pushMatrix();
      translate(centerX - 35, DEFAULT_HEIGHT - 8, -20);
      fill(0);
      noStroke();
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      translate(25, 0, 0);
      pillar(8, 4, 4);
      popMatrix();
      
      //エフェクターつまみ
      pushMatrix();
      translate(centerX - 35, DEFAULT_HEIGHT - 8, 0);
      fill(100);
      noStroke();
      pillar(8, 6, 6);
      translate(25, 0, 0);
      pillar(8, 6, 6);
      translate(25, 0, 0);
      pillar(8, 6, 6);
      translate(25, 0, 0);
      pillar(8, 6, 6);
      popMatrix();
      
      //４つのCUEボタン
      pushMatrix();
      translate(centerX - 35, DEFAULT_HEIGHT - 1, 15);
      fill(250, 166, 5);
      noStroke();    
      box(15, 1, 7);
      translate(25, 0, 0);
      box(15, 1, 7);
      translate(25, 0, 0);
      box(15, 1, 7);
      translate(25, 0, 0);
      box(15, 1, 7);
      popMatrix();
      
      //4つの音量調節バー
      pushMatrix();
      translate(centerX - 35, DEFAULT_HEIGHT - 1, 54);
      fill(0);
      noStroke();
  
      box(3, 1, 37);
      translate(0, 0, 20);
      box(14, 4, 4);
      translate(0, 0, -20);
      translate(25, 0, 0);
      box(3, 1, 37);
      translate(0, 0, -20);
      box(14, 4, 4);
      translate(0, 0, 20);
      translate(25, 0, 0);
      box(3, 1, 37);
      translate(0, 0, -20);
      box(14, 4, 4);
      translate(0, 0, 20);
      translate(25, 0, 0);
      box(3, 1, 37);
      translate(0, 0, 20);
      box(14, 4, 4);
      popMatrix();
      
      //クロスフェーダー
      pushMatrix();
      translate(centerX, DEFAULT_HEIGHT - 1, 95);
      fill(0);
      noStroke();
      box(60, 1, 3);
      translate(X, 0, 0);
      if(X <= -30){
        X = -30;
      }else if(X >= 30){
        X = 30;
      }
      box(4, 14, 20);
      popMatrix();
      
      
      int origX = width / 2 - BOX_WIDTH / 2;
          
      //6つのエフェクトボタン
      pushMatrix();
      translate(origX, DEFAULT_HEIGHT - 1, -7);
      fill(187, 183, 176);
      noStroke();
      translate(12, 0, 0);
      box(12, 1, 6);    
      translate(15, 0, 0);
      box(12, 1, 6);
      translate(15, 0, 0);
      box(12, 1, 6);
      popMatrix();
      pushMatrix();
      translate(origX, DEFAULT_HEIGHT - 1, 7);
      translate(12, 0, 0);
      box(12, 1, 6);
      translate(15, 0, 0);
      box(12, 1, 6);
      translate(15, 0, 0);
      box(12, 1, 6);
      popMatrix();
      
      //ヘッドフォンミックス調節、音量調節のつまみ、差込口
      pushMatrix();
      translate(origX, DEFAULT_HEIGHT - 1, 60);
      translate(25, 0, 0);
      fill(0);
      noStroke();
      pillar(10, 4, 4);
      translate(0, 0, 15);
      pillar(10, 4, 4);
      translate(0, 0, 18);
      pillar(0, 3, 3);
      popMatrix();
      
      //モニター画面表示、テクスチャマッピング
      beginShape();
      texture(img2);
      vertex(origX + 155 , DEFAULT_HEIGHT - 1, -(BOX_DEPTH / 2) + 20, 0, 0);//左上
      vertex(origX + 195 , DEFAULT_HEIGHT - 1, -(BOX_DEPTH / 2) + 20, 129, 0);//右上
      vertex(origX + 195 , DEFAULT_HEIGHT - 1, -(BOX_DEPTH / 2) + 90, 129, 243);//右下
      vertex(origX + 155 , DEFAULT_HEIGHT - 1, -(BOX_DEPTH / 2) + 90, 0, 243);//左下
      endShape();
      
      //TAPボタン
      pushMatrix();
      translate(origX + 175, DEFAULT_HEIGHT - 1, -10);
      fill(61, 204, 28);
      noStroke();
      pillar(1, 4, 4);
      popMatrix();
      
      //エフェクター調整部分
      pushMatrix();
      translate(origX + 175, DEFAULT_HEIGHT - 1, 20);
      fill(0);
      noStroke();
      pillar(8, 4, 4);
      translate(0, 0, 17);
      pillar(8, 4, 4);
      translate(0, 0, 17);
      pillar(8, 4, 4);
      translate(0, 0, 17);
      pillar(8, 4, 4);
      translate(0, 0, 17);
      fill(250, 142, 15);
      noStroke();
      pillar(1, 5, 5);
      popMatrix();
    }
    
    void drawSideBox(int origX) {
      pushMatrix();
      translate(origX , height/2, 0);
      fill(255, 255, 255, 255);
      stroke(0);
      box(BOX_WIDTH, BOX_HEIGHT, BOX_DEPTH);
      popMatrix();
      
      //円形を描く
      pushMatrix();
      translate(origX, DEFAULT_HEIGHT - JOG_HEIGHT, 44);
      fill(255, 255, 255, 255);
      stroke(0);
      pillar(JOG_HEIGHT, JOG_WIDTH - 10, JOG_WIDTH);
      popMatrix();
      
      origX = origX - BOX_WIDTH / 2;
      
      //CUEボタン
      pushMatrix();
      translate(origX + 20, DEFAULT_HEIGHT - 1, 70);
      fill(250, 142, 15);
      noStroke();
      pillar(1, 10, 10);
      popMatrix();
      
      //再生ボタン
      pushMatrix();
      translate(origX + 20, DEFAULT_HEIGHT - 1, 95);
      fill(61, 204, 28);
      noStroke();
      pillar(1, 10, 10);
      popMatrix();
      
      //4つのHOT CUEボタン
      pushMatrix();
      translate(origX + 20, DEFAULT_HEIGHT - 1, -60);
      fill(255, 0, 0);
      noStroke();
      box(19, 1, 8);
      popMatrix();
      
      pushMatrix();
      translate(origX + 20, DEFAULT_HEIGHT - 1, -45);
      fill(16, 248, 245);
      noStroke();
      box(19, 1, 8);
      popMatrix();
      
      // 黄色
      pushMatrix();
      translate(origX + 20, DEFAULT_HEIGHT - 1, -30);
      fill(0, 255, 0);
      noStroke();
      box(19, 1, 8);
      popMatrix();
      
      pushMatrix();
      translate(origX + 20, DEFAULT_HEIGHT - 1, -15);
      fill(0, 0, 255);
      noStroke();
      box(19, 1, 8);
      popMatrix();
      
      //２つのループボタン
      pushMatrix();
      translate(origX + 42, DEFAULT_HEIGHT - 1, -20);
      fill(235, 208, 100);
      noStroke();
      pillar(1, 7, 7);
      popMatrix();
      
      pushMatrix();
      translate(origX + 60, DEFAULT_HEIGHT - 1, -20);
      fill(235, 208, 100);
      noStroke();
      pillar(1, 7, 7);
      popMatrix();
      
      //２つのメモリーCUEボタン
      pushMatrix();
      translate(origX + 140, DEFAULT_HEIGHT - 1, -20);
      fill(2, 2, 2);
      noStroke();
      pillar(1, 5, 5);
      fill(255, 0, 0);
      noStroke();
      pillar(1, 2, 2);
      popMatrix();
      
      pushMatrix();
      translate(origX + 155, DEFAULT_HEIGHT - 1, -20);
      fill(2, 2, 2);
      noStroke();
      pillar(1, 5, 5);
      fill(255, 0, 0);
      noStroke();
      pillar(1, 2, 2);
      popMatrix();
      
      //ジョグの重さ調節
      pushMatrix();
      translate(origX + 165, DEFAULT_HEIGHT - 5, 2);
      fill(0);
      noStroke();
      pillar(5, 7, 7);
      popMatrix();
      
      //モニター画面表示、テクスチャマッピング
      beginShape();
      texture(img1);
      vertex(origX + 55  , DEFAULT_HEIGHT - 1, -(BOX_DEPTH / 2) + 20, 0, 0);//左上
      vertex(origX + 145 , DEFAULT_HEIGHT - 1, -(BOX_DEPTH / 2) + 20, 466, 0);//右上
      vertex(origX + 145 , DEFAULT_HEIGHT - 1, -(BOX_DEPTH / 2) + 70, 466, 245);//右下
      vertex(origX + 55  , DEFAULT_HEIGHT - 1, -(BOX_DEPTH / 2) + 70, 0, 245);//左下
      endShape();
      
      //スクロールのツマミ
      pushMatrix();
      translate(origX + 162, DEFAULT_HEIGHT - 6, -70);
      fill(0);
      noStroke();
      pillar(6, 9, 9);
      popMatrix();
      
      //BPMマスターボタン
      pushMatrix();
      translate(origX + 186, DEFAULT_HEIGHT - 1, 35);
      fill(2, 2, 2);
      noStroke();
      pillar(1, 5, 5);
      fill(255, 0, 0);
      noStroke();
      pillar(1, 4, 4);
      popMatrix();
      
      //BPM調整バー
      pushMatrix();
      translate(origX + 186, DEFAULT_HEIGHT - 1, 75);
      fill(0);
      noStroke();
      box(3, 1, 55);
      box(10, 10, 10);
      popMatrix();
  
    }
    
    //円柱を描く関数
    void pillar(float length, float radius1 , float radius2){
      
      float x,y,z;
      pushMatrix();
      //上面の作成
      beginShape(TRIANGLE_FAN);
      y = -length / 2;
      vertex(0, y, 0);
      for(int deg = 0; deg <= 360; deg = deg + 10){
        x = cos(radians(deg)) * radius1;
        z = sin(radians(deg)) * radius1;
        vertex(x, y, z);
      }
      endShape();
      
      //底面の作成
      beginShape(TRIANGLE_FAN);
      y = length / 2;
      vertex(0, y, 0);
      for(int deg = 0; deg <= 360; deg = deg + 10){
      x = cos(radians(deg)) * radius2;
      z = sin(radians(deg)) * radius2;
      vertex(x, y, z);
      }
      endShape();
      //側面の作成
      beginShape(TRIANGLE_STRIP);
      for(int deg =0; deg <= 360; deg = deg + 5){
      x = cos(radians(deg)) * radius1;
      y = -length / 2;
      z = sin(radians(deg)) * radius1;
      vertex(x, y, z);
      x = cos(radians(deg)) * radius2;
      y = length / 2;
      z = sin(radians(deg)) * radius2;
      vertex(x, y, z);
      }
      endShape();
      popMatrix();
    }
