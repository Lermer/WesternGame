//The Bandit Controled by both P1 and P2
package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Bandit extends FlxSprite {

	var currentState: PlayState;

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY, "assets/Pshootup.png");
		currentState = cast(FlxG.state, PlayState);
	}

	override public function update():Void {
		super.update();
		velocity.x = 0;
		velocity.y = 0;

		// Player 1 Driving Controls
		if (FlxG.keys.LEFT == true){ //Move Left
			velocity.x = -300;
		}
		if (FlxG.keys.RIGHT == true){ //Move Right
			velocity.x = 300;
		}
		if (FlxG.keys.UP == true){ //Move Up
			velocity.y = -300;
		}
		if (FlxG.keys.DOWN == true){ //Move Down
			velocity.y = 300;
		}

		if (y < 0){
			y = 0;
		}
		if (y > FlxG.height-height){
			y = FlxG.height-height;
		}
	}
}