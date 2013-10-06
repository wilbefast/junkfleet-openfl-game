package ships;

import motion.Actuate;

class ShooterShip extends Ship
{
	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y);
		
		radius = 18;
		friction = 0.7;
		acceleration = 10;
		
		graphics.beginFill(0xFF0000);
		graphics.drawCircle(0, 0, radius);
		
		Actuate.timer(0.2).onComplete(openFire);
		
		
	}
	
	private function openFire()
	{
		new PlasmaBall(x, y - radius * 2);
		Actuate.timer(0.1).onComplete(openFire);
	}
	
}