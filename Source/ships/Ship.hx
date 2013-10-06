package ships;

import hacksaw.GameObject;
import hacksaw.V2;
import hacksaw.InputManager;
import hacksaw.Useful;

class Ship extends GameObject
{
	public var controlled = true;
	
	public var acceleration = 1.0;
	public var friction = 0.0;
	
	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y);
	}
	
	// ---------------------------------------------------------------------------
	// UPDATE
	// ---------------------------------------------------------------------------

	public override function update(dt : Float) : Void
	{
		super.update(dt);
		
		var desired_move = new V2(0, 0);
		
		// Accelerate ------------------------------------------------------------
		if (controlled)
		{
			desired_move.x = desired_move.y = 0;
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
			speed.y += desired_move.y * acceleration;
		}
		
		
		// Friction --------------------------------------------------------------
		if (!controlled || desired_move.isNull())
		{
			var friction_multiplier = Math.pow(1 - friction, 10*dt); // should be < 1
			
			if((desired_move.x == 0) || (Useful.sign(speed.x) != Useful.sign(desired_move.x)))
				speed.x *= friction_multiplier;
			if((desired_move.y == 0) || (Useful.sign(speed.y) != Useful.sign(desired_move.y)))
				speed.y *= friction_multiplier;
		}
		
		
		// Minimum speed ---------------------------------------------------------
		if (Math.abs(speed.x) < 0.01)
			speed.x = 0;
		if (Math.abs(speed.y) < 0.01)
			speed.y = 0;
	}
}