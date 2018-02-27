package 
{
	import flash.display.MovieClip;		// pang-manipulate ng objects
	import flash.events.*;				//nakakatamad mag-import ng isa isa hahaha
	import flash.media.Sound;			// background music
	import flash.net.*;		// pang get ng directory links like C:/Desktop/sound/henlo.mp3 chuchu
	import flash.utils.*; 
	import flash.events.*;
	/**
	 * ...
	 * @author Homer C.
	 */
	public class mainSequence extends MovieClip 
	{
		public var mc_Player:MovieClip = new MovieClip();				// main object, eto yung player
		public var testBox:MovieClip = new MovieClip();					// tinetest ko kung magcocollide
		public var detectBossEntrance1:MovieClip = new MovieClip();		// tinetest ko pa lang to
		
		public var boundaries:MovieClip = new MovieClip;				// dapat eto yung walls
		private var collideBox_1:Boolean = false;						// kapag nabunggo tong object na to, magttrigger dapat ng event
		private var _collideBox_1:Boolean = false;						// kulang daw ng arguments e kaya triny ko dagdagan
		
		private var leftKeyisDown:Boolean;								// Boolean para mas madaling iswitch kapag true or false
		private var rightKeyisDown:Boolean;
		private var upKeyisDown:Boolean;
		private var downKeyisDown:Boolean;
		
		public function mainSequence() 
		{
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);		// anong gagawin kapag ni-RELEASE or wala pang pinipindot na key
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);	// anong gagawin kapag may na-PRESS na key
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);		// main function function
		}
		private function gameLoop(e:Event):void 
		{
			playerControl();
			clampPlayer();
			//pagodaGame();
			//overworldMap();
		}
		private function clampPlayer():void //traps the player to the stage, para di lumabas sa gilid
		{
			// dito, magrereduce yung area ng player kapag nahit niya yung boundary ng wall
			// ang tendency is kung anong size ng object, kakalahatiin tapos iaassign sa mc_Player para di makalabas ng stage
			
			if (mc_Player.x < mc_Player.width/2)  //left side
			{
				mc_Player.x = mc_Player.width/2;
			}
			if (mc_Player.x > stage.stageWidth - (mc_Player.width / 2)) // right side
			{
				mc_Player.x = stage.stageWidth - (mc_Player.width / 2);
			}
			if (mc_Player.y < mc_Player.height / 2) // up side
			{
				mc_Player.y = mc_Player.height/2;
			}
			if (mc_Player.y > stage.stageHeight - (mc_Player.height / 2)) // down side
			{
				mc_Player.y = stage.stageHeight - (mc_Player.height/2);
			}
		}
		
		private function keyUp(e:KeyboardEvent):void //when the user stops pressing a key 
		{
			// false ang default kasi wala pa namang napipindot/ni release yung key
			
			if (e.keyCode == 37) //keyCode == 37, eto yung left arrow key
			{
				leftKeyisDown = false;
			}
			if (e.keyCode == 38) //keyCode == 38, eto yung up arrow key
			{
				upKeyisDown = false;
			}
			if (e.keyCode == 39) //keyCode == 39, eto yung right arrow key
			{
				rightKeyisDown = false;
			}
			if (e.keyCode == 40) //keyCode == 40, eto yung down arrow key
			{
				downKeyisDown = false;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void //when a user is pressing a key || kapag nagpress, of course iseset natin sa true
		{
			if (e.keyCode == 37)
			{
				leftKeyisDown = true;
			}
			if (e.keyCode == 38)
			{
				upKeyisDown = true;
			}
			if (e.keyCode == 39)
			{
				rightKeyisDown = true;
			}
			if (e.keyCode == 40)
			{
				downKeyisDown = true;
			}
		}
		
		private function playerControl():void //movement of the character when pressed
		{
			//kapag true ang kahit anong ____KeyisDown, gagalaw yung mc_Player ng 7 pixels depending on what direction siya pupunta
			if (leftKeyisDown == true)
			{
				mc_Player.x -= 7; // papuntang left
			}
			if (rightKeyisDown)
			{
				mc_Player.x += 7; // papuntang right
			}
			if (upKeyisDown)
			{
				mc_Player.y -= 7; // papuntang  up
			}
			if (downKeyisDown)
			{
				mc_Player.y += 7; // papuntang down
			}
		}
		
		// DITO TESTING PHASE KO PA LANG AHHHA
		
		private function overworldMap():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, ov1_boss);
			function ov1_boss(e:KeyboardEvent):void
			{
				if(e.keyCode == 13)
				{	
					trace("IT WORKS!");
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, ov1_boss);
				}
			}
			if(detectBossEntrance1.hitTestObject(mc_Player))
			{
				trace("Pass 1"); // dapat eto yung unang lalabas sa pag nahit yung object na boss
				collideBox_1 = true;
			}

			if(collideBox_1) // kapag nahit
			{
				trace("Pass 2"); //eto lalabas sa output window
				while(collideBox_1 && detectBossEntrance1.hitTestObject(mc_Player))// habang nandun yung mc_Player
				{
					ov1_boss(); // eto dapat lalabas
					collideBox_1 = false;
				}
			}
		}
		
		
	}
}