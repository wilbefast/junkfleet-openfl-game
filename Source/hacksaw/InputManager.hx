package hacksaw;

import flash.events.KeyboardEvent;

class InputState
{

	public var pressed_previously(default, null) = false;
	public var trigger(default, null) = 0;
	
	private var __pressed = false;
	public var pressed(default, set) = false;
	private function set_pressed(value : Bool) : Bool
	{
		pressed_previously = pressed;
		pressed = value;
		
		if (pressed_previously && !pressed)
			trigger = -1;
		else if (pressed && !pressed_previously)
			trigger = 1;
		else
			trigger = 0;
			
		return pressed;
	}
}

class InputManager
{
	// ---------------------------------------------------------------------------
	// SINGLETON
	// ---------------------------------------------------------------------------

	// protected constructor

	private function new()
	{
		flash.Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, function(event : KeyboardEvent) return onKey(true, event));
		flash.Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, function(event : KeyboardEvent) return onKey(true, event));
	}

	private static var instance : InputManager;

	private static function get()
	{
		if(instance == null)
			instance = new InputManager();
		return instance;
	}

	// shortcut static functions
	
	public static function bink()
	{
		get();
	}

	/*public static function loadSound(name : String, _max_instances : Int = 3) : Void
	{
		get().__loadSound(name, _max_instances);
	}*/
	
	// ---------------------------------------------------------------------------
	// INPUT STATES
	// ---------------------------------------------------------------------------
	
	private var states : Map<Int, InputState>;
	
	// ---------------------------------------------------------------------------
	// INPUT EVENTS
	// ---------------------------------------------------------------------------
	
	private function onKey(pressed : Bool, event : KeyboardEvent)
	{
		//if (event.keyCode)
			//;
	}
	
	// ---------------------------------------------------------------------------
	// INPUT EVENTS
	// ---------------------------------------------------------------------------
	
}