//Basic PlayState

package;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxGroup;
import org.flixel.FlxText;
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxWeapon;
import org.flixel.util.FlxVelocity;
import org.flixel.util.FlxRect;

class PlayState extends FlxState {

	// Background
	var bg:Background;
	var bg2:Background2;

	// Game Speed
	var maxSpeed:Float;
	var speed:Float; //Speed of objects realtive to player x pos

	// Scoreboard
	var scoreText:FlxText;

	// Bandit
	var bandit: Bandit;
	var BanditHealth: Int; //Bandit Health
	public var shotgun: Shotgun; //Shotgun shoots Bandit Bullets
	var target: Target; //Target
	public var firing: Bool = false; //Controls Shotgun Firing
	var lives:Int;
	
	// Enemies
	var heli:Heli; //Helicopter Enemy
	var enemies:FlxGroup;
	var numberofenemies:Int;
	public var enemybullets:FlxGroup;

	//Obstacles
	public var cactus:	Obstacle;
	public var cacti: FlxGroup;
	var boulder: Obstacle;
	var boulders: FlxGroup;
	var barricade: Obstacle;
	var barricades: FlxGroup;
	
	// Timers
	var carTimer: Float;
	public var cactusTimer: Float;
	var boulderTimer: Float;
	var barricadeTimer: Float;

	var randomX:Int;

	override public function create():Void {

		// Add Backgrounds
			bg = new Background(0,FlxG.height - 1920);
			add(bg);
			bg2 = new Background2(0,FlxG.height - 3840);
			add(bg2);

		// Player Movement.x variables
			maxSpeed = 400; //Limiter
			speed = 0; //Default
		
		FlxG.volume = 0.2; //controls volume of noises

		// Bandit Controls
			bandit = new Bandit(FlxG.width/2-20, FlxG.height-100);
			add(bandit); // Add Bandit
			target = new Target();
			add(target);//Add Shotgun Target
			shotgun = new Shotgun("shotgun",bandit);
			add(shotgun.group); //Add Shotgun

		// Enemy Controls
			enemybullets = new FlxGroup();
			add(enemybullets);
			numberofenemies = 1;
			enemies = new FlxGroup();

		// Helicopter
			heli = new Heli(50, 300);
			add(heli);
			heli.scale.x = heli.scale.y = .75;

		// Obstacles
			
			
				//boulder = new Obsticle(50, 0, 60, 30);
				//add(boulder);
			//barricade = new Obsticle(200, 0, 150, 30);
			//add(barricade);
			
		// Score Tally
			Reg.score = 0;
			scoreText = new FlxText(0,0,FlxG.width,"Score: " + Std.string(Reg.score));
			scoreText.size = 20;
			scoreText.alignment = "center";
			add(scoreText);

		// Timers
			carTimer = 5;
			boulderTimer = 10;
			barricadeTimer = 20;
			cactusTimer = 20;


			randomX = 0;

			super.create();
	}

	override public function update():Void {

		// Count Down Timers
		carTimer -= FlxG.elapsed;
		cactusTimer --;
		boulderTimer -= FlxG.elapsed;
		barricadeTimer --;

		// Spawns new Obsticles
		if(cactusTimer < 0){
			cactus = new Obstacle(randomX, 0, "assets/cactus.png");
			add(cactus);
			randomX = Math.round(Math.random() * 500);
			cactusTimer =  Math.round(Math.random() * 50);
		}
		if(barricadeTimer < 0){
			barricade = new Obstacle(randomX, 0, "assets/policecarblockade.png");
			add(barricade);
			randomX = Math.round(Math.random() * 500);
			barricadeTimer =  Math.round(Math.random() * 50);
		}
		if(boulderTimer < 0){
			boulder = new Obstacle(randomX, 0,"assets/rock.png");
			add(boulder);
			randomX = Math.round(Math.random() * 500);
			boulderTimer = 10;
		}

		/*
		if(barricadeTimer < 0){
			new Obstacle(Math.round(Math.random() * 500) + 100, 0, "assets/roxk.png");
			barricadeTimer = 10;
		}
		*/

		//Scrolling Obstacle Variables
		cactus.velocity.y = barricade.velocity.y = speed;

		// Scrolling bg variables
		bg.velocity.y = speed;
		bg2.velocity.y = speed;

		


		super.update();//needs to be here? prevents visual glitch

		//Collisions
		FlxG.overlap(cactus, bandit, BanditHitsObstacle);
		FlxG.overlap(barricade, bandit, BanditHitsObstacle);

		// Recycles backgrounds
		if(bg.y > 1920){
			bg.y = -1920;
		}
		if(bg2.y > 960){
			bg2.y = FlxG.height-3840;
		}

		// Speed multiplier
		speed = maxSpeed-Math.abs(FlxG.width/2 - bandit.x);//abs makes negative values positive.
		// Speed equals maxspeed minus half the screen minus player position
		if(speed < 0){
			speed = 0;
		}
		else if(speed > maxSpeed){
			speed = maxSpeed;
		}

		// Shoots Gun 
		if (FlxG.mouse.justPressed()){
			firing = true;
		}	
		if (FlxG.mouse.justReleased()){
			firing = false;
		}	
		if (firing){
			if (shotgun.fireAtMouse()){
				//FlxG.play("assets/shoot.mp3");
		
			}
		}	
	}
		public function BanditHitsObstacle(obstacle: Obstacle, bandit: Bandit):Void { // Obsticle kills Bandit
		obstacle.kill();
		bandit.kill();
		FlxG.log(Std.string("hit"));
		//FlxG.play("Explosion"); // NO SOUND?
	}

}