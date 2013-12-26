package ships;
import hacksaw.GameObject;

class EnemyShot extends GameObject
{

	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y, 4);
		
		graphics.beginFill(0x00FF00);
			graphics.drawCircle(0, 0, radius);
		graphics.endFill();
		
		speed.y = 500;
	}
	
	// ---------------------------------------------------------------------------
	// UPDATE
	// ---------------------------------------------------------------------------

	
	public override function update(dt : Float) : Void
	{
		super.update(dt);
		
		if (y > stage.stageHeight + radius)
			purge = true;
	}
}