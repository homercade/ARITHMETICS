package 
{
	import fl.controls.Button;
	import fl.controls.TextInput;
	import flash.display.MovieClip;
	import flash.system.fscommand;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Homer C.
	 */
	public class menu extends MovieClip
	{
		public var charname:TextInput;
		private var new_game:Button;
		private var quit_game:Button;
		
		public function menu() 
		{
			new_game.addEventListener(MouseEvent.CLICK, newgame_Frame);
			quit_game.addEventListener(MouseEvent.CLICK, quit_Frame);
		}
		
		private function mainMenu(e:Event):void
		{
			firPage();
		}
		
		private function firPage():void
		{
			stop();
			function newgame_Frame(e:MouseEvent):void
			{
				gotoAndPlay(2);
			}

			function quit_Frame(e:MouseEvent):void
			{
				fscommand("quit");
			}
			
		}
		
	}

}