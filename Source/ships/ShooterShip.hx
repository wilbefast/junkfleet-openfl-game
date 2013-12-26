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
		
		Actuate.timer(FIRE_PERIOD).onComplete(openFire);
	}
	
	private static inline var FIRE_PERIOD = 0.15;
	
	private function openFire()
	{
		if (purge)
			return;
		
		new PlasmaBall(x, y - radius * 2);
		Actuate.timer(FIRE_PERIOD).onComplete(openFire);
	}
	
}