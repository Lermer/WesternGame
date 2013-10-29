// Basic bullet. Fires upward.

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class EnemyBullet extends FlxSprite {

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY, "assets/bomb3.png");
	}

	override public function update():Void {
		velocity.y = 300;

		if (y > FlxG.height){
			kill();
		}
		
		super.update();
	}
}