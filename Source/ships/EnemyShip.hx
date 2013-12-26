package ships;

import motion.Actuate;

class EnemyShip extends Ship
{
	private var stoppedToFire : Bool = false;

	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y);
		radius = 10;
		
		graphics.beginFill(0x00FF00);
		graphics.drawCircle(0, 0, radius);
		
		moveOut();
	}
	
	// ---------------------------------------------------------------------------
	// MOVE OUT
	// ---------------------------------------------------------------------------
	
	private static inline var SPEED = 92.0;
	private static inline var MIN_MOVE_DURATION = 2.0;
	private static inline var MAX_MOVE_DURATION = 6.0;
	
	private function moveOut()
	{
		if (purge)
			return;
		
		var direction = Math.random() * Math.PI * 2;
		stoppedToFire = false;
		speed.x = Math.cos(direction) * SPEED;
		speed.y = Math.sin(direction) * SPEED;
		friction = 0;
		
		Actuate.timer(MIN_MOVE_DURATION + Math.random() * (MAX_MOVE_DURATION - MIN_MOVE_DURATION))
				.onComplete(standAndShoot);
	}
	
	// ---------------------------------------------------------------------------
	// STAND AND SHOOT
	// ---------------------------------------------------------------------------
	
	private static inline var MIN_SHOOT_DURATION = 4.0;
	private static inline var MAX_SHOOT_DURATION = 10.0;
	
	private static inline var DELAY_BEFORE_FIRST_SHOT = 2.0;
	private static inline var SHOOT_PERIOD = 6.0;
	
	private function standAndShoot()
	{
		if (purge)
			return;
		
		speed.x = speed.y = 0;
		stoppedToFire = true;
		friction = 0.7;
		
		Actuate.timer(MIN_SHOOT_DURATION + Math.random() * (MAX_SHOOT_DURATION - MIN_SHOOT_DURATION))
				.onComplete(moveOut);
				
		Actuate.timer(DELAY_BEFORE_FIRST_SHOT)
				.onComplete(shoot);
	}
	
	private function shoot()
	{
		if (purge)
			return;
		
		if (stoppedToFire)
		{
			new EnemyShot(x, y + 2 * radius);
			Actuate.timer(SHOOT_PERIOD)
					.onComplete(shoot);
		}
	}
	
	// ---------------------------------------------------------------------------
	// UPDATE
	// ---------------------------------------------------------------------------

	public override function update(dt : Float) : Void
	{
		super.update(dt);
		
		y += dt * 40;
	}
}