// Basic start screen

package;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;

class MenuState extends FlxState {

	var t:FlxText;
	var www:FlxText;

	override public function create():Void {
		FlxG.bgColor = 0xffC39753;
		www = new FlxText(0, 240, 640, "WILD WILD WEST");
		t = new FlxText(0, 500, 640, "SPACE");
		t.size = 48;
		www.size = 80;
		t.alignment = www.alignment = "center";
		t.font = www.font = "assets/mensch-bold.ttf";
		add(t);
		add(www);

		//fadein
			FlxG.flash(0xffffffff, 0.5);

		Reg.score = 0;

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
			FlxG.switchState(new ControlState());
		}
	
}