package;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Mouse extends FlxSprite {

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY, "assets/Mouse.png");
	}

	override public function update():Void {
		super.update();
	}
}