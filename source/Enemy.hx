// Basic enemy

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Enemy extends FlxSprite {

	var timer:FlxTimer;
	public var speedY:Float;

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		timer = new FlxTimer();
		timer.start(5);
	}

	override public function update():Void {
		super.update();

	}
}