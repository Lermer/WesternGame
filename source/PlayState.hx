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
import org.flixel.FlxObject;

class PlayState extends FlxState {

	// Background
	var bg:Background;
	var bg2:Background2;
	// Game Speed
	var maxSpeed:Float;
	var speed:Float; //Speed of objects realtive to player xpos
	var accel:Float;
	// Scoreboard
	var scoreText:FlxText;
	var Lives:FlxText;
	var Health:FlxText;
	// Bandit
	var bandit:Bandit;
	var BanditHealth:Int; //Bandit Health
	var BanditLives:Int;
	//Gun
	public var shotgun: Shotgun; //Shotgun shoots Bandit Bullets
	var target: Target; //Target
	public var firing: Bool = false; //Controls Shotgun Firing
	// Enemies
	var heli:Heli; //Helicopter Enemy
	var enemies:FlxGroup;
	var numberofenemies:Int;
	public var enemybullets:FlxGroup;
	//Obstacles
	var cacti: FlxGroup;
	var cars: FlxGroup;
	var boulders: FlxGroup;
	var barricades: FlxGroup;
	//Counters
	var NumberofCars:Int;
	var NumberofCacti:Int;
	var NumberofBoulders:Int;
	// Timers
	var carTimer: Float;
	var cactusTimer: Float;
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
			add(enemies);
		// Helicopter
			heli = new Heli(50, 300);
			add(heli);
		// Obstacles
			cacti = new FlxGroup();
			add(cacti);
			boulders = new FlxGroup();
			add(boulders);
			barricades = new FlxGroup();
			add(barricades);
			cars = new FlxGroup();
			add(cars);
		//Obstacle Count
			NumberofCars = 10;
			NumberofCacti = 20;
			NumberofBoulders= 30;
		// Score Tally
			Reg.score = 0;
			scoreText = new FlxText(0,20,FlxG.width,"Score: " + Std.string(Reg.score));
			scoreText.size = 20;
			scoreText.alignment = "center";
			add(scoreText);
		// Timers
			carTimer = 5;
			boulderTimer = 10;
			barricadeTimer = 20;
			cactusTimer = 2;
		//Health
			BanditHealth = 3;
			Reg.health = 3;
			Health = new FlxText(10,770,FlxG.width,"Health: " + Std.string(Reg.health));
			Health.size = 20;
			Health.alignment = "Left";
			add(Health);
		//Lives
			BanditLives = 3;
			Reg.life = 3;
			Lives = new FlxText(540,770,FlxG.width,"Lives: " + Std.string(Reg.life));
			Lives.size = 20;
			Lives.alignment = "Left";
			add(Lives);

			randomX = 0;

			FlxG.play("bgMusic", .1 , true);

			super.create();
	}

	override public function update():Void {

		

		// Count Down Timers
		carTimer -= FlxG.elapsed;
		cactusTimer -= FlxG.elapsed;
		boulderTimer  -= FlxG.elapsed;
		barricadeTimer -= FlxG.elapsed;

		//Controls where Obstacles spawn on Xaxis
		randomX = (Math.round(Math.random()*360)+90);

		// Spawns new Obstacles
		if(cactusTimer < 0){
			cacti.add(new Obstacle(randomX, 0, "assets/cactus.png"));
			add(cacti);
			cactusTimer =  20;//Math.round(Math.random() * 50);
		}
		if(barricadeTimer < 0){
			barricades.add(new Obstacle(randomX, 0, "assets/policecarblockade.png"));
			barricadeTimer =  10;//Math.round(Math.random() * 50);
		}
		if(boulderTimer < 0){
			boulders.add(new Obstacle(randomX, 0,"assets/rock.png"));
			boulderTimer =  10;//Math.round(Math.random() * 50);
		}
		if(carTimer < 0){
			cars.add(new Car(randomX, 820));
			carTimer = 20;
		}
		/*
		if(NumberofCars == 0){
			heli.add(new Heli(50, 820,"assets/police.png"));
			randomX = Math.round(Math.random() * 500);
			NumberofCars = 10;
		}
		*/

		//Scrolling Obstacle Variables
		cacti.setAll("speedY", speed);
		boulders.setAll("speedY", speed);
		barricades.setAll("speedY", speed);
		
		cars.setAll("speedY", accel);
		
		// Scrolling bg variables
		bg.velocity.y = speed;
		bg2.velocity.y = speed;

		accel = speed * -1 * 0.25;

		super.update();

		//Collisions: bandit vs Obstacles
		FlxG.overlap(cacti, bandit, BanditHitsObstacle);
		FlxG.overlap(boulders, bandit, BanditHitsObstacle);
		FlxG.overlap(barricades, bandit, BanditHitsObstacle);
		FlxG.overlap(cars, bandit, BanditHitsObstacle);
		//Car vs Obstacles
		FlxG.overlap(cars, cacti, EnemyHitsObstacle);
		FlxG.overlap(cars, boulders, EnemyHitsObstacle);
		FlxG.overlap(cars, barricades, EnemyHitsObstacle);
		//Bandit vs Obstacles
		FlxG.overlap(shotgun.group, cars, ShotgunHitsTarget);
		FlxG.overlap(shotgun.group, heli, ShotgunHitsTarget);
		

		//bullet vs enemies
		//FlxG.overlap(shotgun, cars, BanditShootsCar);

		// Recycles Backgrounds
		if(bg.y > 1920){
			bg.y = bg2.y - 1920;
		}
		if(bg2.y > 960){
			bg2.y = bg.y - 1920;
		}

		// Speed Multiplier
		speed = maxSpeed-Math.abs(FlxG.width/2 - bandit.x);//abs makes negative values positive.
		
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
				FlxG.play("Shoot",.12);
			}
			if(BanditHealth == 0){
				Reg.life --;
				BanditLives --;
				BanditHealth = 3;
			}

		}
	}
		public function BanditHitsObstacle(obstacle: Obstacle, bandit: Bandit):Void { // Obsticle kills Bandit
		obstacle.kill();
		//bandit.kill();
		BanditHealth --;
		Reg.health --;
		FlxG.play("Explosion"); // NO SOUND?
		}
		public function EnemyHitsObstacle(obstacle:Obstacle, c:Car):Void { // 
		c.kill();
		obstacle.kill();
		//FlxG.log(Std.string("hit"));
		FlxG.play("Explosion"); // NO SOUND?
		}
		public function ShotgunHitsTarget(shotgun: FlxObject, target: FlxSprite):Void { // 
		target.kill();	
		FlxG.log(Std.string("hit"));
		FlxG.play("Explosion"); // NO SOUND?
		}

}