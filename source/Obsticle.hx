// Basic enemy

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Obsticle extends FlxSprite {


	public function new(startX:Float, startY:Float, width: Int, height: Int):Void {
		super(startX, startY);
		makeGraphic(width, height, 0xff0000ff);

	
	}

	override public function update():Void {
		super.update();

		if(y < -height){
			kill();
		}
	}
}