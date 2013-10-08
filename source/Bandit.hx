//The Bandit Controled by both P1 and P2
package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Bandit extends FlxSprite {

	var currentState: PlayState;

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		makeGraphic(60, 20, 0xffffffff);

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

		/* Player 2 Bandit Bullet Controls
		if (FlxG.keys.justPressed("A")){
			cast(FlxG.state, Screen2).shotgun.add(new Bullet(x, y));
		}
		if (FlxG.keys.justPressed("D")){
			cast(FlxG.state, Screen2).shotgun.add(new Bullet(x, y));
		}
		if (FlxG.keys.justPressed("W")){
			cast(FlxG.state, Screen2).shotgun.add(new Bullet(x, y));
		}
		if (FlxG.keys.justPressed("S")){
			cast(FlxG.state, Screen2).shotgun.add(new Bullet(x, y));
		}
		*/

		//Keeps Bandit on Screen
		if (x < 0){
			x = 0;
		}
		if (x > FlxG.width-width){
			x = FlxG.width-width;
		}
		if (y < 0){
			y = 0;
		}
		if (x > FlxG.height-height){
			x = FlxG.height-height;
		}
	}
}