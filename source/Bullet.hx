package;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Bullet extends FlxSprite{

	var targetX: Float;
	var targetY: Float;

	public var directionX: Float;
	public var directionY: Float;

	public var speedX: Float;
	public var speedY: Float;


	public function new(startX: Float, startY: Float):Void{
		super(startX, startY);
		makeGraphic(10, 10, 0xffffff00);

		var targetX = x;
		var targetY = y;

		speedX = 30;
		speedY = 30;
		directionX = 0;
		directionY = 0;
	}

	override public function update(): Void{

		if( FlxG.mouse.pressed() == true){
			targetX = FlxG.mouse.x - 28;
			targetY = FlxG.mouse.y - 28;
		}

		if( y > targetY){
			directionY -= ((y-targetY)/300);
		}
		if( x > targetX){
			directionX -= ((x-targetX)/300);
		}
		if( y < targetY){

			directionY += ((targetY-y)/300);
		}
		if( x < targetX){
			directionX += ((targetX-x)/300);
		}

		//Velocity is speed times direction
		velocity.x = speedX * directionX;
		velocity.y = speedY * directionY;

		//Kill Bullets if off Screen
		if(y < -1){
			kill();
		}
		if(y > 800){
			kill();
		}
		if(x < -1){
			kill();
		}
		if(x > 640){
			kill();
		} 
		super.update();
	}
}