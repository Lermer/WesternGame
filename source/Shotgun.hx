package;

import org.flixel.FlxG;
import org.flixel.plugin.photonstorm.FlxWeapon;
import org.flixel.util.FlxVelocity;
import org.flixel.util.FlxRect;
import org.flixel.FlxSprite;
import org.flixel.FlxObject;

class Shotgun extends FlxWeapon{

	public function new(name:String, parentRef:FlxSprite):Void{
		super(name, parentRef);
		setFireRate(300);
		makePixelBullet(40, 20, 5, 0xFF000000);
		setBulletBounds(new FlxRect(0, 0, 640, 800));
		setBulletSpeed(800);
		bulletDamage = 1;
	}

	override public function update(): Void{
		
		super.update();
	}
}