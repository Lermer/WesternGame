//The Bandit Controled by both P1 and P2
package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Bandit extends FlxSprite {

	var currentState: PlayState;

	private var bullet_delay:Int;

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		makeGraphic(60, 20, 0xffffffff);

		currentState = cast(FlxG.state, PlayState);

		bullet_delay = 0;
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

		if (FlxG.mouse.pressed() == true && bullet_delay < 0){ //Move Down
			cast(FlxG.state, PlayState).shotgun.add(new Bullet(x ,y));
			//resetdelay
			bullet_delay = 20;
		}
		bullet_delay --;


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