package;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Bullet extends FlxSprite{

	public function new(startX: Float, startY: Float):Void{
		super(startX, startY);
		makeGraphic(10, 10, 0xffffff00);

	}

	override public function update(): Void{
		//velocity.y = -300;

		


		// Kill Bullets if off Screen
		if(y < -height){
			kill();
		}
		if(y > height){
			kill();
		}
		if(x < -width){
			kill();
		}
		if(x > width){
			kill();
		}
		super.update();
	}
}