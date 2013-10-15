// Basic enemy

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Heli extends Enemy {

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		loadGraphic("assets/helicopter.png",true,false,64,32);
		addAnimation("heli",[0,1], 800, true);
		play("heli");

	}

	override public function update():Void {
		super.update();

		if (timer.finished == true){
			cast(FlxG.state, PlayState).enemybullets.add(new EnemyBullet(x+30, y+40));
	}

	}
}