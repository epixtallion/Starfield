Particle[] p = new Particle[80];
void setup()
{
	background(0);
	size(500, 500);
	for (int i = 0; i < p.length; i++){
		p[i] = randParticle(true);
	}

}
void draw()
{
	fill(0);
	rect(0,0,500,500);
	for (int i = 0; i < p.length; i++){
		if(p[i].isDead()) p[i] = randParticle(false);
		p[i].move();
		p[i].show();
	}
}
Particle randParticle(boolean init){
	int chance = (int) (Math.random()*101 - 1);
	if (chance < 10) return new OddballParticle(init);
	else if (chance < 25) return new JumboParticle(init);
	else return new NormalParticle(init);
}
class NormalParticle implements Particle
{
	int x, y, speed;
	boolean dead = false;
  	float angle;
	color c;
	NormalParticle(){
	  c = color((int) (Math.random()*25+230),
	    (int) (Math.random()*25+230),
	    (int) (Math.random()*25+230));
	  x = 250;
	  y = 250;
	  angle = radians((float) Math.random()*360);
	}
	//Constructor
	NormalParticle(boolean init){
		c = color((int) (Math.random()*25+230),
			(int) (Math.random()*25+230),
			(int) (Math.random()*25+230));
		if (init){
			x = (int) (Math.random()*506 - 5);
			y = (int) (Math.random()*506 - 5);
		angle = atan((float) (x-250) / (float) (250 - y));
		} else {
			x = 250;
			y = 250;
			angle = radians((float) Math.random()*360);
		}
	}

	public boolean isDead(){ return dead; }
	public void move(){
		x = x + (int) (cos(angle)*x/2);
		y = y + (int) (sin(angle)*x/2);
	}
	public void show(){
		if (x < 0 || x > 500 || y < 0 || y > 500){
			dead = true;
			System.out.println("Dead!");
		} else {
			stroke(255,255,255);
			point(x,y);
		}
	}
}
interface Particle
{
	public boolean isDead();
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	int x, y;
	boolean dead = false;
	color c;
	//Constructor
	OddballParticle(boolean init){
    if (init){
      x = (int) (Math.random()*506 - 5);
      y = (int) (Math.random()*506 - 5);
    } else {
      x = 250;
      y = 250;
    }
	}

  public boolean isDead(){ return dead; }
	public void move(){
		x = x + (int) (Math.random()*9-4);
		y = y + (int) (Math.random()*9-4);
	}
	public void show(){
		fill(255, 50, 50);
		ellipse(x, y, 20, 20);
	}
}
class JumboParticle extends NormalParticle
{
	//Constructor
	JumboParticle(boolean init){
    c = color((int) (Math.random()*25+230),
      (int) (Math.random()*25+230),
      (int) (Math.random()*25+230));
    if (init){
      x = (int) (Math.random()*506 - 5);
      y = (int) (Math.random()*506 - 5);
      angle = atan((float) (x-250) / (float) (250 - y));
    } else {
      x = 250;
      y = 250;
      angle = (float) Math.random()*360;
    }
	}
	public void show(){
		angle = angle + (int) (Math.random()*5);
		//rotate(radians(angle));
		fill(255);
		rect(x-10, y-10, 20, 20);
		//rotate(0);
	}
}