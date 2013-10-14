package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Thrust extends FlxSprite{

	public function new(): Void{
		super(-100,-100);
		loadGraphic("assets/thrust.png", true, false, 12, 24);
		addAnimation("fire",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],30, false);
		addAnimation("idle", [16,17,18,19,18,17]);

		
	}
	override public function update(): Void{
		super.update();
	}
}