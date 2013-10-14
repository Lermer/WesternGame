// Basic enemy

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Obstacle extends FlxSprite {


	public function new(startX:Float, startY:Float, image: String):Void {
		super(startX, startY, image);
	}

	override public function update():Void {
		super.update();

		if(y < -height){
			kill();
		}
	}
}