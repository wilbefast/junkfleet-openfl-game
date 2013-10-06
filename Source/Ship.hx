import hacksaw.GameObject;
import hacksaw.V2;
import hacksaw.InputManager;

class Ship extends GameObject
{
	public var controlled = true;
	
	public var acceleration = 0.0;
	public var friction = 0.0;
	
	public function new(__x : Float, __y : Float, __radius : Float = 0.0, __acceleration = 15.0, __friction = 0.1) 
	{
		super(__x, __y, __radius);
		
		acceleration = __acceleration;
		friction = __friction;
		
		graphics.beginFill(0x000000);
		graphics.drawCircle(0, 0, __radius);
	}
	
	// ---------------------------------------------------------------------------
	// UPDATE
	// ---------------------------------------------------------------------------

	public override function update(dt : Float) : Void
	{
		super.update(dt);
		
		
		// Accelerate ------------------------------------------------------------
		
		var desired_move = new V2(0, 0);
		if (InputManager.getState("left").pressed)
			desired_move.x--;
		if (InputManager.getState("right").pressed)
			desired_move.x++;
		if (InputManager.getState("up").pressed)
			desired_move.y--;
		if (InputManager.getState("down").pressed)
			desired_move.y++;
			
		desired_move.normalise();
		
		speed.x += desired_move.x*acceleration;
		speed.y += desired_move.y*acceleration;
		
		
		// Friction --------------------------------------------------------------
		var friction_multiplier = Math.pow(1 - friction, 10*dt); // should be < 1
		speed.x *= friction_multiplier;
		speed.y *= friction_multiplier;
		if (Math.abs(speed.x) < 0.01)
			speed.x = 0;
		if (Math.abs(speed.y) < 0.01)
			speed.y = 0;
	}
}