// Basic enemy

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Heli extends Enemy {

	var bulletTimer:Float;

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		loadGraphic("assets/helicopter.png",true,false,64,32);
		addAnimation("heli",[0,1], 800, true);
		play("heli");

		scale.x = scale.y = 2;

		bulletTimer = (FlxG.random()*1) + 0.5; //pick number between 0-x, add y seconds till enemy shoots

	}

	override public function update():Void {
		bulletTimer -= FlxG.elapsed; //Add/count down time(seconds) to 0

		//x = x += 2;

		if(bulletTimer < 0){
			cast(FlxG.state, PlayState).enemybullets.add(new EnemyBullet(x + 24, y + 70));
			bulletTimer = (FlxG.random()*2) + 2;
	}
		super.update();
	}
}