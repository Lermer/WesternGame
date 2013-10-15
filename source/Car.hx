// Basic enemy

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Car extends Enemy {

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		loadGraphic("assets/policecar.png",true,false,39,95);
		addAnimation("police",[0,1], 800, true);
		play("police");
	}

	override public function update():Void {
		super.update();

		y = y -= 1;
	}
}