package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Homer C.
	 */
	public class mc_bullet extends Sprite 
	{
		
		public function mc_bullet() 
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
			addEventListener(Event.ENTER_FRAME, bulletLoop)
		}
		
		private function bulletLoop(e:Event):void 
		{
			this.y  -= 13;
		}
	}

}