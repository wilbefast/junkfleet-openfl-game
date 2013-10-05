import flash.display.Sprite;

import hacksaw.DefaultFont;
import hacksaw.DefaultTextField;
import hacksaw.SoundManager;
import hacksaw.SceneManager;

class Main extends Sprite 
{
	public function new () 
	{
		super ();

		// ------------------------------------------------------------------------
		// Start Hacksaw
		// ------------------------------------------------------------------------

		DefaultFont.load();
		
		//SceneManager.add("Title", new TitleScene());
		SceneManager.add("Game", new GameScene());
		//SceneManager.add("Victory", new VictoryScene());

		// Sound
		//SoundManager.loadSound("teleport_in");
		//SoundManager.setMuted();

		// Music
		//snd_music = Assets.getSound("assets/music.mp3"); // flash doesn't like OOG :'(
		//channel = snd_music.play();
		//channel.addEventListener(Event.SOUND_COMPLETE, onMusicEnd);

	}
}