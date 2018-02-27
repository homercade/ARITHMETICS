package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import mainSequence;
	/**
	 * ...
	 * @author ...
	 */
	public class mcProjectile extends MovieClip 
	{
		
public var mcProjectiles: MovieClip = new MovieClip();
		private var nSpeed: Number;
		public function mcProjectile() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdd);
		}
		private function onAdd(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdd);
			init();
		}
		private function init():void
		{
			var nProjectile:Number = 2;
			startPositioning();
		}
		private function startPositioning():void
		{
			nSpeed = randomNumber(9, 13);
			var nRandProjectile:Number = randomNumber(1, 2);
			trace(nRandProjectile);
			if (nRandProjectile == 1)
			{
				mcProjectiles.gotoAndStop(1);
				mcProjectiles.x = stage.stageWidth + (mcProjectiles.width / 2);
				trace("startPositioning IF Passed!");
			}
			else
			{
				mcProjectiles.gotoAndStop(2);
				mcProjectiles.x = stage.stageWidth + (mcProjectiles.width / 2);
				trace("startPositioning ELSE Passed!");
			}
		}
		function randomNumber(low:Number = 0, high:Number = 1):Number
		{
			return Math.floor(Math.random() * (1 + high - low)) + low;
			trace("randomizer Passed!");
		}

	}

}