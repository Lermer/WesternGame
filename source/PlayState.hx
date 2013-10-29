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
	var LivesText:FlxText;
	var HealthText:FlxText;
	// Bandit
	var bandit:Bandit;
	var Health:Int;
	var Lives:Int;
	var playerLife:FlxGroup;
	//Enemy Health
	var HeliHealth:Int;
	var CarHealth:Int;
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
	//explosion
	public var explosions:FlxGroup;
	//bandit x and y
	var banditX:Float;
	var banditY:Float;
	//timer vars
	var a:Int;
	var b:Int;
	var c:Int;
	//Counters
	var NumberofCars:Int;
	var NumberofCacti:Int;
	var NumberofBoulders:Int;
	// Timers
	var carTimer: Float;
	var cactusTimer: Float;
	var boulderTimer: Float;
	var barricadeTimer: Float;
	var flashTimer:Float;
	//randomX
	var randomX:Int;
	var barricadeX:Int;
	var KilledCars:Int;

	override public function create():Void {

		// Add Backgrounds
			bg = new Background(0,FlxG.height - 1920);
			add(bg);
			bg2 = new Background2(0,FlxG.height - 3840);
			add(bg2);
		// Player Movement.x variables
			maxSpeed = 400; //Limiter
			speed = 0; //Default
		//controls global volume
			FlxG.volume = 0.5;
		// Bandit Controls
			bandit = new Bandit(FlxG.width/2-30, FlxG.height-300);
			add(bandit); // Add Bandit
			shotgun = new Shotgun("shotgun",bandit);
			add(shotgun.group); //Add Shotgun
		// Enemy Controls
			enemybullets = new FlxGroup();
			add(enemybullets);
			numberofenemies = 1;
			enemies = new FlxGroup();
			add(enemies);
		// Helicopter
			heli = new Heli(-100, 300);
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
		//explosions
			explosions = new FlxGroup();
			add(explosions);
		//target
			target = new Target();
			add(target);//Add Shotgun Target
		//Obstacle Count
			NumberofCars = 0;
			NumberofCacti = 0;
			NumberofBoulders= 0;
			KilledCars = 0;
		// Score Tally
			scoreText = new FlxText(0,20,FlxG.width,"Score: " + Std.string(Reg.score));
			scoreText.size = 42;
			scoreText.font = "assets/mensch-bold.ttf";
			scoreText.alignment = "center";
			add(scoreText);
		// Timers
			carTimer = 2;
			boulderTimer = 10;
			barricadeTimer = 20;
			cactusTimer = 2;
			flashTimer = 0.5;
		//obstacle timer updates
			a = 2;
			b = 5;
			c = 10;
		//Bandit Health
			HealthText = new FlxText(10,760,FlxG.width,"Health: " + Std.string(Reg.health));
			HealthText.font = "assets/mensch-bold.ttf";
			HealthText.size = 32;
			HealthText.alignment = "Left";
			add(HealthText);
		//
			Health = 3;
			Lives = 1;
		//EnemyHealth
			HeliHealth = 10;
			CarHealth = 2;
		//Lives
			LivesText = new FlxText(520,760,FlxG.width,"Lives: " + Std.string(Reg.lives));
			LivesText.font = "assets/mensch-bold.ttf";
			LivesText.size = 32;
			LivesText.alignment = "Left";
			add(LivesText);
			playerLife = new FlxGroup();
				for(i in 0...Health){
			playerLife.add(new PlayerLife(i*18, 4));
			}
			add(playerLife);

		//
			randomX = 0;
			barricadeX = 0;
		//
			banditX = 0;
			banditY = 0;
		//SFX
			FlxG.play("bgMusic", .6 , true);
			FlxG.play("Siren", .2, true);
		//fadein
			FlxG.flash(0xffffffff, 0.3);

			super.create();
	}

	override public function update():Void {

		banditX = bandit.x;
		banditY = bandit.y;

		// Count Down Timers
		carTimer -= FlxG.elapsed;
		cactusTimer -= FlxG.elapsed;
		boulderTimer  -= FlxG.elapsed;
		barricadeTimer -= FlxG.elapsed;

		//Controls where Obstacles spawn on Xaxis
		randomX = (Math.round(Math.random()*360)+90);
		barricadeX = (Math.round(Math.random()*200)+120);

		// Spawns new Obstacles
		if(cactusTimer < 0){
			randomX = (Math.round(Math.random()*360)+90);
			cacti.add(new Obstacle(randomX, 0, "assets/cactus.png"));
			add(cacti);
			cactusTimer = a;
		}
		if(boulderTimer < 0){
			randomX = (Math.round(Math.random()*360)+90);
			boulders.add(new Obstacle(randomX, 0,"assets/rock.png"));
			boulderTimer =  b;
		}
		if(barricadeTimer < 0){
			barricades.add(new Obstacle(barricadeX, 0, "assets/policecarblockade.png"));
			barricadeTimer =  c;
		}
		if(carTimer < 0){
			randomX = (Math.round(Math.random()*360)+90);
			cars.add(new Car(randomX, 820));
			carTimer = 2;
		}

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
		FlxG.overlap(shotgun.group, heli, ShotgunHitsHeli);
		//bullets vs bandit
		FlxG.overlap(bandit, enemybullets, BulletHitBandit);
		
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
				FlxG.play("Shoot",.5);
			}
		}
		//Bandit Loses life for Leaving path
		if (bandit.x < 80){
			bandit.x = 320;
			Reg.health --;
			playerLife.remove(playerLife.members[Health-1]);
			Health --;
		}
		if (bandit.x > 500){
			bandit.x = 320;
			Reg.health --;
			playerLife.remove(playerLife.members[Health-1]);
			Health --;
		}
		if(HeliHealth == 0){
			heli.kill();
		}
		//difficulty ramps with killed cars
		if(KilledCars > 5){
			a = 2;
			b = 6;
			c = 8;
			FlxG.play("Heli", .1, false);
			heli.x = heli.x += 2;
		}
		if(heli.x > 700) {
			heli.kill();
		}

		if(KilledCars > 20){
			a = 1;
			b = 3;
			c = 5;
		}

		//flashes when hurt
		if (FlxG.overlap(heli, shotgun.group) && flashTimer > 0) {
    		flashTimer -= FlxG.elapsed;
    		heli.color = 0xbb3333;//flash red
		} 
			else {
    		heli.color = 0xffffff;
			}
		//bandit health
		if(Health == 0){
				Lives --;
				Reg.lives --;
				Health = 3;
			}
		if(Lives == 0){
				FlxG.switchState(new EndState());
			}

		//scores
		Reg.score ++;//adds endurance points
		//a Reg Health test. Since Reg health works we dont need BanditHealth.
		scoreText.text = ("Score: " + Std.string(Reg.score));
		HealthText.text = ("Health: " + Std.string(Reg.health));
		LivesText.text = ("Lives: " + Std.string(Reg.lives));
		//Health and lives counter
	}
		public function BanditHitsObstacle(obstacle: FlxSprite, bandit: Bandit):Void { // Obsticle kills Bandit
		explosions.add(new Explosion(obstacle.x, obstacle.y+25));
		playerLife.remove(playerLife.members[Health-1]);
		obstacle.kill();
		Reg.health --;
		Health --;
		FlxG.play("Explosion");
		}
		public function EnemyHitsObstacle(c:Car, obstacle:Obstacle):Void { 
		explosions.add(new Explosion(obstacle.x, obstacle.y+25));
		c.kill();
		obstacle.kill();
		FlxG.play("Explosion");
		}
		public function ShotgunHitsTarget(shotgun: FlxObject, target:FlxSprite):Void { // 
		explosions.add(new Explosion(target.x, target.y+25));
		shotgun.kill();
		target.kill();//car
		KilledCars ++;
		FlxG.play("Explosion");
		}
		public function ShotgunHitsHeli(shotgun:FlxObject, h:Heli):Void { // 
		explosions.add(new Explosion(h.x, h.y));
		shotgun.kill();
		HeliHealth--;
		FlxG.play("Explosion");
		}
		public function BulletHitBandit(bandit:Bandit, eBullet:EnemyBullet):Void { //Void is data type for no data type/no numeric value; like int/float
		explosions.add(new Explosion(bandit.x, bandit.y));
		eBullet.kill();
		Reg.health --;
		Health --;
		FlxG.play("Explosion");
	}
}