// Basic enemy

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Heli extends Enemy {
	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		loadGraphic("assets/enemy.png",true,false,64,64);
		addAnimation("idle",[0,1],10);
		play("idle");
	}

	override public function update():Void {
		super.update();
}
}