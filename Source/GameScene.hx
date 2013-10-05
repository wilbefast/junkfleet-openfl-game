import hacksaw.Scene;
import hacksaw.DefaultTextField;

class GameScene extends Scene
{

	public function new() 
	{
		super();
		
		addChild(new DefaultTextField("Hello GameScene!", 100, 100));
	}
	
}