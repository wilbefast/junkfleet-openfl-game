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
		
		bink = new DefaultTextField("Hello GameScene!", 100, 100);
		addChild(bink);
		//addChild(new DefaultTextField("Hello GameScene!", 100, 100));
	}
		
	// ---------------------------------------------------------------------------
	// OPENFL CALLBACKS
	// ---------------------------------------------------------------------------
	
	public override function onFrameEnter(event : Event) : Void
	{
		if(InputManager.getState("C").trigger == 1)
			trace("YABAAAAADAAAABAADOOOOOOOOOOOOOOOO!");
	}
	
}