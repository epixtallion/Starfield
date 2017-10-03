Particle[] p = new Particle[40];
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
		if(p[i].dead) p[i] = randParticle(false);
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
class NormalParticle
{
	int x, y, speed;
	public boolean dead;
	color c;
	//Constructor
	NormalParticle(){
		dead = false;
		x = 250;
		y = 250;
		c = color((int) (Math.random()*25+230),
			(int) (Math.random()*25+230),
			(int) (Math.random()*25+230));
	}
	//Initialization constructor
	NormalParticle(boolean init){
		dead = false;
		c = color((int) (Math.random()*25+230),
			(int) (Math.random()*25+230),
			(int) (Math.random()*25+230));
		if (init){
			x = (int) (Math.random()*506 - 5);
			y = (int) (Math.random()*506 - 5);
		} else {
			x = 250;
			y = 250;
		}
	}

	public void move(){
		int angle = atan((double) (x-250) / (double) (250 - y));
		x = x + cos(angle)*x/2;
		y = y + sin(angle)*x/2;
	}
	public void show(){
		if (x < 0 || x > 500 || y < 0 || y > 500){
			dead = true;
		} else {
			stroke(255,255,255);
			point(x,y);
		}
	}
}
interface Particle
{
	int x, y;
	public boolean dead;
	color c;
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	int x, y;
	public boolean dead;
	color c;
	//Constructor
	OddballParticle(){
		dead = false;
		x = 250;
		y = 250;
	}
	//Initialization constructor
	OddballParticle(boolean init){
		return OddballParticle();
	}

	public void move(){

	}
	public void show(){
		
	}
}
class JumboParticle extends NormalParticle implements Particle
{
	//Constructor
	JumboParticle(){
		dead = false;
		x = 250;
		y = 250;
	}
	//Initialization constructor
	JumboParticle(boolean init){
		dead = false;
		if (init){
			x = (int) (Math.random()*506 - 5);
			y = (int) (Math.random()*506 - 5);
		} else {
			x = 250;
			y = 250;
		}
	}

	int angle = (int) (Math.random()*364 - 3);
	public void show(){
		angle = angle + (int) (Math.random()*5);
		rotate(radians(angle));
		rect(x-10, y-10, 20, 20);
		rotate(0);
	}
}