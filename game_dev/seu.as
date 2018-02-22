package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Homer C.
	 */

	public class seu extends MovieClip 
	{
		public var mc_Player:MovieClip;
		private var leftKeyisDown:Boolean;
		private var rightKeyisDown:Boolean;
		private var upKeyisDown:Boolean;
		private var downKeyisDown:Boolean;
		
		public function seu() 
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function gameLoop(e:Event):void 
		{
			playerControl();
			clampPlayer();
		}
		
		private function clampPlayer():void 
		{
			if (mc_Player.x < mc_Player.width/2)
			{
				mc_Player.x = mc_Player.width/2;
			}
			else if (mc_Player.x > stage.stageWidth - (mc_Player.width / 2))
			{
				mc_Player.x = stage.stageWidth - (mc_Player.width / 2);
			}
			else if (mc_Player.y < mc_Player.height / 2)
			{
				mc_Player.y = mc_Player.height/2;
			}
			else if (mc_Player.y > stage.stageHeight - (mc_Player.height / 2))
			{
				mc_Player.y = stage.stageHeight - (mc_Player.height/2);
			}
		}
		
		private function playerControl():void 
		{
			
			if (leftKeyisDown == true)
			{
				mc_Player.x -= 7;
			}
			if (rightKeyisDown)
			{
				mc_Player.x += 7;
			}
			if (upKeyisDown)
			{
				mc_Player.y -= 7;
			}
			if (downKeyisDown)
			{
				mc_Player.y += 7;
			}
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == 37)
			{
				leftKeyisDown = false;
			}
			if (e.keyCode == 38)
			{
				upKeyisDown = false;
			}
			if (e.keyCode == 39)
			{
				rightKeyisDown = false;
			}
			if (e.keyCode == 40)
			{
				downKeyisDown = false;
			}
			if (e.keyCode == 32)
			{
				fireBullet();
			}
		}
		
		private function fireBullet():void 
		{
			var newBullet:mc_bullet = new mc_bullet();
			stage.addChild(newBullet);
			newBullet.x = mc_Player.x;
			newBullet.y = mc_Player.y;
		}
		
		private function keyDown(e:KeyboardEvent):void 
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
		
	}

}