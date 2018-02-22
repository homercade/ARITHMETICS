package 
{
	//import fl.controls.Button;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.sampler.NewObjectSample;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Homer C.
	 */
	public class quiz extends MovieClip
	{
	// Declaration of Flash variables
		public var ansA_txt: TextField;
		public var ansB_txt: TextField;
		public var ansC_txt: TextField;
		public var ansD_txt: TextField;
		public var ques_txt: TextField;
		//public var score_txt: TextField;
		/*public var butt_a: Button;
		public var butt_b: Button;
		public var butt_c: Button;
		public var butt_d: Button;*/
		
	// Declaration of inside variables
		//public var sum: Number;
		//public var hit: Number;
		//public var nScore: Number;
		//private var validateAns: Boolean;
		private var choices:Array = new Array(4);
		private var operate:Array = new Array(2);
		
		public function quiz() 
		{
			for (var counter:int = 0; counter <= 10; counter++)
			{
				questionMake();
				//if (hit == sum){nScore++; }
			}
		}
		private function questionMake():void
		{
		//Generates two random numbers
			operate[0] = Math.floor (Math.random() * 21);
			operate[1] = Math.floor (Math.random() * 20);
			
		//For trace purposes
			ques_txt.text = String(operate[0] + " + " + operate[1] + "?");
			trace(operate[0] + " + " + operate[1] + "?");
			
		//Assign sum for the generated numbers
			//sum = operate[0] + operate[1];
			
		//Mixing incorrect answers
			choices[0] = operate[0] + operate[1];
			choices[1] = choices[0] + 1;
			choices[2] = choices[0] + 2;
			choices[3] = choices[0] - 1;
			
		//Placing choices into a new array to randomize position
		    var answers:Array = new Array(choices[0], choices[1], choices[2], choices[3]);
			answers.sort(randSort);
			
		//Display text
			ansA_txt.text = String(answers[0]);
			ansB_txt.text = String(answers[1]);
			ansC_txt.text = String(answers[2]);
			ansD_txt.text = String(answers[3]);
		
		//Choosing Answer
			
		}
		private function randSort(a:*, b:*):Number
		{
			if (Math.random() < 0.5) 
				return -1
			else return 1;
		}
		/*private function updateScore():void
		{
			score_txt.text = "Score: " + nScore;
		}
		*/
	}

}