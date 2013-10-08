//Basic PlayState

package;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxGroup;
import org.flixel.FlxText;
import org.flixel.FlxSprite;
//import org.flixel.system.input.FlxMouse;

class PlayState extends FlxState {

	//Background Image
	var bgImage:FlxSprite;

	//Bandit
	var bandit: Bandit;
	public var shotgun: FlxGroup;
	var target: Target;

	override public function create():Void {

		bgImage = new FlxSprite(0,0,"assets/map.png");
		add(bgImage); // Add Background Image

		bandit = new Bandit(FlxG.width/2-20, FlxG.height-20);
		add(bandit); // Add Bandit
		shotgun = 
		new FlxGroup();
		add(shotgun);
		target = new Target();
		add(target);


		super.create();
	}

	override public function update():Void {
		FlxG.log(Std.string(Std.int(FlxG.mouse.screenY)));
		
		super.update();
	}	
}