import flash.events.Event;
import flash.Lib;

import hacksaw.Scene;
import hacksaw.DefaultTextField;
import hacksaw.InputManager;

import ships.Ship;
import ships.ShooterShip;
import ships.ShieldShip;
import ships.MotherShip;
import ships.FuelShip;

class GameScene extends Scene
{
	private var shipControls : Array< { buttonName : String, ship : Ship } >;
	
	
	public function new() 
	{
		super();
		
		// Create ships ------------------------------------------------------------
		var sw = Lib.current.stage.stageWidth, sh = Lib.current.stage.stageHeight;
		shipControls = new Array<{ buttonName : String, ship : Ship }>();
		shipControls[0] = { buttonName : "frontLeft", ship : new ShooterShip(sw*0.4, sh*0.85) }
		shipControls[1] = { buttonName : "frontRight", ship : new ShieldShip(sw*0.6, sh*0.8) }
		shipControls[2] = { buttonName : "backLeft", ship : new MotherShip(sw*0.4, sh*0.95) }
		shipControls[3] = { buttonName : "backRight", ship : new FuelShip(sw*0.6, sh*0.9) }
	}
		
	// ---------------------------------------------------------------------------
	// OPENFL CALLBACKS
	// ---------------------------------------------------------------------------
	
	public override function onFrameEnter(event : Event) : Void
	{
		// refresh list of controlled ships
		for (control in shipControls)
			control.ship.controlled = (InputManager.getState(control.buttonName).pressed);
			
		
	}
	
}