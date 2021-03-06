package nme;


import openfl.Assets;


class AssetData {

	
	public static var className = new #if haxe3 Map <String, #else Hash <#end Dynamic> ();
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			className.set ("Beep", nme.NME_assets_data_beep_mp3);
			type.set ("Beep", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("Explosion", nme.NME_assets_death_mp3);
			type.set ("Explosion", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("bgMusic", nme.NME_assets_banditbgm_mp3);
			type.set ("bgMusic", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("Shoot", nme.NME_assets_gunshot_wav);
			type.set ("Shoot", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("Siren", nme.NME_assets_siren_mp3);
			type.set ("Siren", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("Heli", nme.NME_assets_helicopter_mp3);
			type.set ("Heli", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("assets/acidstructure.ttf", nme.NME_assets_acidstructure_ttf);
			type.set ("assets/acidstructure.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("assets/banditbgm.mp3", nme.NME_assets_banditbgm_mp4);
			type.set ("assets/banditbgm.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/bomb3.png", nme.NME_assets_bomb3_png);
			type.set ("assets/bomb3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/cactus.png", nme.NME_assets_cactus_png);
			type.set ("assets/cactus.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/Clouds.png", nme.NME_assets_clouds_png);
			type.set ("assets/Clouds.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/autotiles.png", nme.NME_assets_data_autotiles_png);
			type.set ("assets/data/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/autotiles_alt.png", nme.NME_assets_data_autotiles_alt_png);
			type.set ("assets/data/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/base.png", nme.NME_assets_data_base_png);
			type.set ("assets/data/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/beep.mp3", nme.NME_assets_data_beep_mp4);
			type.set ("assets/data/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/data/button.png", nme.NME_assets_data_button_png);
			type.set ("assets/data/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_a.png", nme.NME_assets_data_button_a_png);
			type.set ("assets/data/button_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_b.png", nme.NME_assets_data_button_b_png);
			type.set ("assets/data/button_b.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_c.png", nme.NME_assets_data_button_c_png);
			type.set ("assets/data/button_c.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_down.png", nme.NME_assets_data_button_down_png);
			type.set ("assets/data/button_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_left.png", nme.NME_assets_data_button_left_png);
			type.set ("assets/data/button_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_right.png", nme.NME_assets_data_button_right_png);
			type.set ("assets/data/button_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_up.png", nme.NME_assets_data_button_up_png);
			type.set ("assets/data/button_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_x.png", nme.NME_assets_data_button_x_png);
			type.set ("assets/data/button_x.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button_y.png", nme.NME_assets_data_button_y_png);
			type.set ("assets/data/button_y.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/courier.ttf", nme.NME_assets_data_courier_ttf);
			type.set ("assets/data/courier.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("assets/data/cursor.png", nme.NME_assets_data_cursor_png);
			type.set ("assets/data/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/default.png", nme.NME_assets_data_default_png);
			type.set ("assets/data/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/fontData10pt.png", nme.NME_assets_data_fontdata10pt_png);
			type.set ("assets/data/fontData10pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/fontData11pt.png", nme.NME_assets_data_fontdata11pt_png);
			type.set ("assets/data/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/handle.png", nme.NME_assets_data_handle_png);
			type.set ("assets/data/handle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo.png", nme.NME_assets_data_logo_png);
			type.set ("assets/data/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo_corners.png", nme.NME_assets_data_logo_corners_png);
			type.set ("assets/data/logo_corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo_light.png", nme.NME_assets_data_logo_light_png);
			type.set ("assets/data/logo_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/nokiafc22.ttf", nme.NME_assets_data_nokiafc22_ttf);
			type.set ("assets/data/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("assets/data/stick.png", nme.NME_assets_data_stick_png);
			type.set ("assets/data/stick.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/flixel.png", nme.NME_assets_data_vcr_flixel_png);
			type.set ("assets/data/vcr/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/open.png", nme.NME_assets_data_vcr_open_png);
			type.set ("assets/data/vcr/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/pause.png", nme.NME_assets_data_vcr_pause_png);
			type.set ("assets/data/vcr/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/play.png", nme.NME_assets_data_vcr_play_png);
			type.set ("assets/data/vcr/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/record_off.png", nme.NME_assets_data_vcr_record_off_png);
			type.set ("assets/data/vcr/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/record_on.png", nme.NME_assets_data_vcr_record_on_png);
			type.set ("assets/data/vcr/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/restart.png", nme.NME_assets_data_vcr_restart_png);
			type.set ("assets/data/vcr/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/step.png", nme.NME_assets_data_vcr_step_png);
			type.set ("assets/data/vcr/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/stop.png", nme.NME_assets_data_vcr_stop_png);
			type.set ("assets/data/vcr/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vis/bounds.png", nme.NME_assets_data_vis_bounds_png);
			type.set ("assets/data/vis/bounds.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/death.mp3", nme.NME_assets_death_mp4);
			type.set ("assets/death.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/Explosion.png", nme.NME_assets_explosion_png);
			type.set ("assets/Explosion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/HaxeFlixel.svg", nme.NME_assets_haxeflixel_svg);
			type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/heart.png", nme.NME_assets_heart_png);
			type.set ("assets/heart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/Helicopter.mp3", nme.NME_assets_helicopter_mp4);
			type.set ("assets/Helicopter.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/helicopter.png", nme.NME_assets_helicopter_png);
			type.set ("assets/helicopter.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/helicopter1.png", nme.NME_assets_helicopter1_png);
			type.set ("assets/helicopter1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/helicopter2.png", nme.NME_assets_helicopter2_png);
			type.set ("assets/helicopter2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/mensch-bold.ttf", nme.NME_assets_mensch_bold_ttf);
			type.set ("assets/mensch-bold.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("assets/Mouse.png", nme.NME_assets_mouse_png);
			type.set ("assets/Mouse.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/police.png", nme.NME_assets_police_png);
			type.set ("assets/police.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/policecar.png", nme.NME_assets_policecar_png);
			type.set ("assets/policecar.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/policecarblockade.png", nme.NME_assets_policecarblockade_png);
			type.set ("assets/policecarblockade.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/Pshootdown.png", nme.NME_assets_pshootdown_png);
			type.set ("assets/Pshootdown.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/Pshootleft.png", nme.NME_assets_pshootleft_png);
			type.set ("assets/Pshootleft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/Pshootright.png", nme.NME_assets_pshootright_png);
			type.set ("assets/Pshootright.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/Pshootup.png", nme.NME_assets_pshootup_png);
			type.set ("assets/Pshootup.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/road.png", nme.NME_assets_road_png);
			type.set ("assets/road.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/roadlighter.png", nme.NME_assets_roadlighter_png);
			type.set ("assets/roadlighter.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/rock.png", nme.NME_assets_rock_png);
			type.set ("assets/rock.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/sam/bullets.png", nme.NME_assets_sam_bullets_png);
			type.set ("assets/sam/bullets.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/sam/death.mp3", nme.NME_assets_sam_death_mp3);
			type.set ("assets/sam/death.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sam/enemy.png", nme.NME_assets_sam_enemy_png);
			type.set ("assets/sam/enemy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/sam/life_icon.png", nme.NME_assets_sam_life_icon_png);
			type.set ("assets/sam/life_icon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/sam/ships.png", nme.NME_assets_sam_ships_png);
			type.set ("assets/sam/ships.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/sam/shoot.mp3", nme.NME_assets_sam_shoot_mp3);
			type.set ("assets/sam/shoot.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sam/thrust.png", nme.NME_assets_sam_thrust_png);
			type.set ("assets/sam/thrust.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/shoot.mp3", nme.NME_assets_shoot_mp3);
			type.set ("assets/shoot.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/siren.mp3", nme.NME_assets_siren_mp4);
			type.set ("assets/siren.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/stagecoachv1Frame1.png", nme.NME_assets_stagecoachv1frame1_png);
			type.set ("assets/stagecoachv1Frame1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/target.png", nme.NME_assets_target_png);
			type.set ("assets/target.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/target1.png", nme.NME_assets_target1_png);
			type.set ("assets/target1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/WASD.png", nme.NME_assets_wasd_png);
			type.set ("assets/WASD.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}


class NME_assets_data_beep_mp3 extends flash.media.Sound { }
class NME_assets_death_mp3 extends flash.media.Sound { }
class NME_assets_banditbgm_mp3 extends flash.media.Sound { }
class NME_assets_gunshot_wav extends flash.media.Sound { }
class NME_assets_siren_mp3 extends flash.media.Sound { }
class NME_assets_helicopter_mp3 extends flash.media.Sound { }
class NME_assets_acidstructure_ttf extends flash.text.Font { }
class NME_assets_banditbgm_mp4 extends flash.media.Sound { }
class NME_assets_bomb3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_cactus_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_clouds_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_base_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_beep_mp4 extends flash.media.Sound { }
class NME_assets_data_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_down_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_left_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_right_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_y_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_courier_ttf extends flash.text.Font { }
class NME_assets_data_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata10pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_handle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_nokiafc22_ttf extends flash.text.Font { }
class NME_assets_data_stick_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vis_bounds_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_death_mp4 extends flash.media.Sound { }
class NME_assets_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_haxeflixel_svg extends flash.utils.ByteArray { }
class NME_assets_heart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_helicopter_mp4 extends flash.media.Sound { }
class NME_assets_helicopter_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_helicopter1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_helicopter2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_mensch_bold_ttf extends flash.text.Font { }
class NME_assets_mouse_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_police_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_policecar_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_policecarblockade_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_pshootdown_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_pshootleft_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_pshootright_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_pshootup_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_road_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_roadlighter_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_rock_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_sam_bullets_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_sam_death_mp3 extends flash.media.Sound { }
class NME_assets_sam_enemy_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_sam_life_icon_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_sam_ships_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_sam_shoot_mp3 extends flash.media.Sound { }
class NME_assets_sam_thrust_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_shoot_mp3 extends flash.media.Sound { }
class NME_assets_siren_mp4 extends flash.media.Sound { }
class NME_assets_stagecoachv1frame1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_target_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_target1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_wasd_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
