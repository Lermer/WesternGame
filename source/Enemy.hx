// Basic enemy

package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.util.FlxTimer;

class Enemy extends FlxSprite {

	var timer:FlxTimer;

	public function new(startX:Float, startY:Float):Void {
		super(startX, startY);
		loadGraphic("assets/enemy.png",true,false,64,64);
		addAnimation("idle",[0,1],10);
		play("idle");
		timer = new FlxTimer();
		timer.start(5);

	}

	override public function update():Void {
		super.update();

		if (timer.finished == true){
			//cast(FlxG.state, PlayState).bullets.add(new EnemyBullet(x+30, y+40));
	}

	}
}