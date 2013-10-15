package;

import flash.Lib;
import org.flixel.FlxGame;

class ProjectClass extends FlxGame {	
	public function new() {
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		// Sets up size and adds first screen
			//I made the PlayState the mainscreen just as we set up the game
		super(stageWidth, stageHeight, MenuState, 1, 30, 30);
	}
}
