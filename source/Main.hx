package;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.ui.Keyboard;
import org.flixel.FlxGame;

class Main extends Sprite {
	
	public function new () {
		super();
		
		if (stage != null) 
			init();
		else 
			addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(?e:Event = null):Void {
		if (hasEventListener(Event.ADDED_TO_STAGE)) {
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		var demo:FlxGame = new ProjectClass();
		addChild(demo);
	}
}