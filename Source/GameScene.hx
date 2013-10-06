import hacksaw.Scene;
import hacksaw.DefaultTextField;
import hacksaw.InputManager;

import flash.events.Event;

class GameScene extends Scene
{
	var bink : DefaultTextField;
	
	public function new() 
	{
		super();
		
		addChild(new DefaultTextField("Hello GameScene!", 100, 100));
		
		new Ship(100, 100, 32);
	}
		
	// ---------------------------------------------------------------------------
	// OPENFL CALLBACKS
	// ---------------------------------------------------------------------------
	
	public override function onFrameEnter(event : Event) : Void
	{
	}
	
}