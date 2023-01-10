//マウスの座標を取得
ArrayList<PVector> savePosition = new ArrayList<PVector>();
Boolean clickChecker = false;

PImage button;

//文字の太さを変えられる
public float thickness = 5;
int inputSaveDate;

class WrightSetting
{
  ArrayList<PVector> position;
  WrightSetting(){
  }
    WrightSetting (ArrayList<PVector> savePosition)
    {
        position = savePosition;
    }
    void drawCircle(float x , float y)
    {
        circle(x , y , thickness);
    }
}
WrightSetting wright;

void setup()
{
   size(1200,500);
   background(255);
   noStroke();
   fill(0);
   frameRate(60);
   
   button =  loadImage("");
   image(button , 1200,500);
 
   
   wright = new WrightSetting();
}

void draw()
{
   if(mousePressed)
   {
     //マウスの座標を追加する
     savePosition.add(new PVector(mouseX,mouseY));
   }
   if(clickChecker)
   {
     if((frameCount - inputSaveDate) + 1 < wright.position.size())
     {
       wright.drawCircle(wright.position.get((frameCount - inputSaveDate)- 1).x , 
                         wright.position.get((frameCount - inputSaveDate)- 1).y);
     }
   }
}

void mousePressed()
{
   if(mouseX > width - 31 && mouseY > height - 31)
   {
     clickChecker = true;
     wright = new WrightSetting(savePosition);
     
     inputSaveDate = frameCount;
   }
}
