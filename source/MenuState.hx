// Basic start screen

package;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;

class MenuState extends FlxState {

	var t:FlxText;
	var www:FlxText;
	var wasd:FlxText;

	override public function create():Void {
		FlxG.bgColor = 0xffC39753;
		www = new FlxText(0, 240, 640, "WILD+WILD=WEST");
		wasd = new FlxText(0, 400, 640, "W.A.S.D II ARROWS");
		t = new FlxText(0, 500, 640, "Press SPACE to start");
		t.size = wasd.size = 48;
		www.size = 80;
		//t.color = wasd.color = www.color = 0xff000000;
		t.alignment = wasd.alignment = www.alignment = "center";
		t.font = wasd.font = www.font = "assets/mensch-bold.ttf";
		add(t);
		add(www);
		add(wasd);

		super.create();

		Reg.score = 0;
	}
	
	override public function update():Void {
		if(FlxG.keys.SPACE == true){
			FlxG.switchState(new PlayState());
		}

		super.update();
	}	
}