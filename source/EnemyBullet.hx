// Basic bullet. Fires upward.

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class EnemyBullet extends FlxSprite {

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		loadGraphic("assets/bullets.png",true,false,12,24);
		addAnimation("loop",[0,1,2,3]);
		play("loop");
	}

	override public function update():Void {
		velocity.y = 300;

		if (y > FlxG.height){
			kill();
		}
		
		super.update();
	}
}