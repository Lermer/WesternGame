package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Target extends FlxSprite {

	var currentState: PlayState;


	public function new():Void {
		super(FlxG.mouse.x - 28, FlxG.mouse.y - 28, "assets/target1.png");
		currentState = cast(FlxG.state, PlayState);
	}

	override public function update():Void {
		super.update();

		x = FlxG.mouse.x - 28;
		y = FlxG.mouse.y - 28;


	}
}