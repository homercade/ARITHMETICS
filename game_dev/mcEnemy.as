package 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Homer C.
	 */
	public class mcEnemy extends MovieClip 
	{
		
		public function mcEnemy() 
		{
			this.stop()
		}
		
		function randomNumber(a:Number = 0, b:Number = 1):Number
		{
			reutrn Math.floor(Math.random() * (1 + b - a)) + a;
			
			
		}
	}

}