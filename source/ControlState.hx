// Basic start screen

package;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;

class ControlState extends FlxState {

	//text
	var t1:FlxText;
	var t2:FlxText;
	var wasd:FlxText;
	var aim:FlxText;
	//images
	var mouse:Mouse;
	var keys:WASD;

	override public function create():Void {
		FlxG.bgColor = 0xffC39753;
		wasd = new FlxText(90, 440, 640, "TO MOVE");
		aim = new FlxText(400, 440, 640, "TO AIM");
		t1 = new FlxText(-90, 100, 800, "------> SPACE ----->");
		t2 = new FlxText(-90, 640, 800, "------> SPACE ----->");
		t1.size = t2.size = wasd.size = aim.size = 48;
		t1.alignment = t2.alignment = "center";
		wasd.alignment = aim.alignment = "left";
		t1.font = t2.font = wasd.font = aim.font = "assets/mensch-bold.ttf";
		add(t1);
		add(t2);
		add(wasd);
		add(aim);

		mouse = new Mouse(400,280);
		add(mouse);

		keys = new WASD(80,280);
		add(keys);

		FlxG.flash(0xffffffff, 0.3);
		
		super.create();
	}
	
	override public function update():Void {

		if(FlxG.keys.SPACE == true)
		{
			FlxG.fade(0xffffffff, 0.3, onFade);//fade out
		}

		super.update();
	}	
	public function onFade():Void {
			FlxG.switchState(new PlayState());
		}
}