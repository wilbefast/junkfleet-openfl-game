package ships;

import flash.display.DisplayObject;
import flash.display.Sprite;

import motion.Actuate;

import hacksaw.GameObject;
import hacksaw.V2;
import hacksaw.InputManager;
import hacksaw.Useful;
import hacksaw.LineGraphics;
import hacksaw.Time;

class Ship extends GameObject
{

	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y);
		
		selection_reticule = LineGraphics.drawCircle(0, 0, 32, 0xFF0000, 2.0);
		selection_reticule.alpha = 0;
		selection_reticule.scaleX = selection_reticule.scaleY = 0;
		addChild(selection_reticule);
	}
	
	// ---------------------------------------------------------------------------
	// COLLISIONS
	// ---------------------------------------------------------------------------

	public override function onCollisionWith(other : GameObject) : Void
	{
		// repulse away from other ships
		if(Std.is(other, Ship))
		{
			// repulsion vector
			var repulse = new V2(x - other.x, y - other.y);
			x += (radius + other.radius)/repulse.x * 10 * Time.getDelta();
			y +=(radius + other.radius)/repulse.y * 10 * Time.getDelta();
		}
		else if (Std.is(other, PlasmaBall))
		{
			other.purge = true;
			purge = true;
		}
	}
	
	
	// ---------------------------------------------------------------------------
	// SELECTION AND CONTROL
	// ---------------------------------------------------------------------------
	
	private var selection_reticule : DisplayObject;
	public var controlled(default, set) = true;
	private function set_controlled(value : Bool) : Bool
	{
		controlled = value;
		
		var visibility = (controlled ? 1 : 0);	
		Actuate.tween(selection_reticule, 0.5, { alpha : visibility, scaleX : visibility, scaleY : visibility }, true);
		
		return controlled;
	}
	
	
	// ---------------------------------------------------------------------------
	// SHIP DAMAGE
	// ---------------------------------------------------------------------------
	
	private var damage(default, set) = 0.0;
	private function set_damage(value : Float) : Float
	{
		damage = value;
		if (damage >= 1)
			this.purge = true;
		
		return damage;
	}
	
	
	// ---------------------------------------------------------------------------
	// UPDATE
	// ---------------------------------------------------------------------------

	public var acceleration = 1.0;
	public var friction = 0.0;
	
	public override function update(dt : Float) : Void
	{

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
		var friction_multiplier = Math.pow(1 - friction, 10*dt); // should be < 1
		
		if((desired_move.x == 0) || (Useful.sign(speed.x) != Useful.sign(desired_move.x)))
			speed.x *= friction_multiplier;
		if((desired_move.y == 0) || (Useful.sign(speed.y) != Useful.sign(desired_move.y)))
			speed.y *= friction_multiplier;
		
		
		// Minimum speed ---------------------------------------------------------
		if (Math.abs(speed.x) < 0.01)
			speed.x = 0;
		if (Math.abs(speed.y) < 0.01)
			speed.y = 0;
			
			
		// Borders ----------------------------------------------------------------
		if (controlled)
		{
			if (x + speed.x*dt + radius > stage.stageWidth)
			{
				x = stage.stageWidth - radius;
				speed.x = 0;
			}
			else if (x + speed.x*dt - radius < 0)
			{
				x = radius;
				speed.x = 0;
			}
			
			
			if (y + speed.y*dt + radius > stage.stageHeight)
			{
				y = stage.stageHeight - radius;
				speed.y = 0;
			}
			else if (y + speed.y*dt - radius < 0)
			{
				y = radius;
				speed.y = 0;
			}
		}
		
		// Apply speed ------------------------------------------------------------
		super.update(dt);
		
	}
}