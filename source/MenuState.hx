// Basic start screen

package;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;

class MenuState extends FlxState {

	var t:FlxText;

	override public function create():Void {
		FlxG.bgColor = 0xff0000ff;
		t = new FlxText(0, 200, 640, "Press SPACE to start");
		t.size = 40;
		t.color = 0xffffffff;
		t.alignment = "center";
		t.font = "assets/acidstructure.ttf";
		add(t);
		super.create();
	}
	
	override public function update():Void {
		if(FlxG.keys.SPACE == true){
			FlxG.switchState(new PlayState());
		}
		super.update();
	}	
}