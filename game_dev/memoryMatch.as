package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.*;
	import flash.utils.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Homer C.
	 * 
	 */
	public class memoryMatch extends MovieClip 
	{
		public var req:URLRequest = new URLRequest("ost/mural.mp3"); 
		public var muralOST:Sound = new Sound(req); 
		public var muralChannel:SoundChannel = new SoundChannel();
		var fClip:Logo
		var sClip:Logo
		
		var memTimer:Timer;
		var frames:Array = new Array (1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10);
		
		var comboTime:Number = 0;
		public var maxCards:Number = 10;
		
		public function memoryMatch() 
		{
			muralChannel = muralOST.play(0, 25);
			sortCards();
			roundTimer();
			
		}
		public function sortCards():void
		{
			for (var i:Number = 1; i <= 4; i++)
			{
				for (var j:Number = 1; j <= 5; j++)
				{
					var myLogo:Logo = new Logo();
					var index = Math.floor(Math.random() * frames.length);
					
					myLogo.frameNo = frames[index];
					frames.splice(index, 1);
					
					addChild(myLogo);
					myLogo.x = j * 90;
					myLogo.y = i * 90;
					
					myLogo.gotoAndStop(11);
					myLogo.addEventListener(MouseEvent.CLICK, openLogo);
				}
			}
		}
		public function finishedGame():void
		{
			if (maxCards == 0 || cSec==0)
			{
				rTimerV.stop();
				muralChannel.stop();
				trace("Done!");
			}
		}
		private function openLogo(e:MouseEvent)
		{
			var clickObj:Logo = Logo(e.target);

			if (fClip == null)
			{
				fClip = clickObj;
				fClip.gotoAndStop(fClip.frameNo);
			}
			else if (sClip == null && fClip != clickObj)
			{
				sClip = clickObj;
				sClip.gotoAndStop(sClip.frameNo);
				
				if (fClip.frameNo == sClip.frameNo)
				{
					memTimer = new Timer(1000, 1);
					memTimer.start();
					maxCards--;
					trace("Cards left: " + maxCards);
					memTimer.addEventListener(TimerEvent.TIMER_COMPLETE, removeLogos)
				}
				else
				{
					memTimer = new Timer(1000, 1);
					memTimer.start();
					memTimer.addEventListener(TimerEvent.TIMER_COMPLETE, resetLogos)
				}
			}
		}
		private function removeLogos(e:TimerEvent)
		{
			removeChild(fClip);
			removeChild(sClip);
			memTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, removeLogos);
			fClip = null;
			sClip = null;
		}
		private function resetLogos (e:TimerEvent)
		{
			fClip.gotoAndStop(11);
			sClip.gotoAndStop(11);
			memTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, resetLogos);
			fClip = null;
			sClip = null;
		}

		private function roundTimer():void
		{
			var cSec: Number = 80;
			var rTimerV:Timer = new Timer(1000, cSec);
			rTimerV.addEventListener(TimerEvent.TIMER, rTimer_func);
			rTimerV.start();

			function rTimer_func(e:TimerEvent):void
			{
				rTimer.text = cSec.toString();
				cSec--;
			}
		}
	}

}