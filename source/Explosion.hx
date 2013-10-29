package;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Explosion extends FlxSprite {

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		loadGraphic("assets/Explosion.png",true,false,50,50);
		addAnimation("Explode",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35], 60, false);
		play("Explode");

		scale.x = scale.y = 2.5;
	}

	override public function update():Void {
		super.update();

		y = y += 5;
	}
}