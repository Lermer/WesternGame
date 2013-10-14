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
		t = new FlxText(0, 200, 640, "Your score: " + Std.string(Reg.score));
		t.size = 40;
		t.alignment = "center";
		add(t);

		timer = new FlxTimer();
		timer.start(5);
		
		super.create();
	}
	
	override public function update():Void {
		if (timer.finished == true){
			FlxG.switchState(new MenuState());
		}

		super.update();
	}	
}