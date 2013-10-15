// Basic timed end screen

package;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.util.FlxTimer;	

class EndState extends FlxState {

	var t:FlxText;
	var timer:FlxTimer;

	override public function create():Void {
		FlxG.bgColor = 0xffC39753;
		t = new FlxText(0, 200, 640, "Your score: " + Std.string(Reg.score));
		t.size = 60;
		t.alignment = "center";
		t.font = "assets/mensch-bold.ttf";
		add(t);

		timer = new FlxTimer();
		timer.start(10);
		
		super.create();
	}
	
	override public function update():Void {
		if (timer.finished == true){
			FlxG.switchState(new MenuState());
		}

		super.update();
	}	
}