package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.text.*;
	import flash.events.*;
	/**
	 * ...
	 * @author Homer
	 */
	public class catchingGame extends MovieClip
	{
		var catcher:Catcher;
		var nextObject:Timer;
		var objects:Array = new Array();
		var leftKey:Boolean;
		var rightKey:Boolean;
		var score:int = 0;
		const speed:Number = 7.0;
		
		public function catchingGame()
		{
			catcher = new Catcher();
			catcher.y = 450;
			addChild(catcher);
			setNextObject();
			addEventListener(Event.ENTER_FRAME, moveObjects);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		public function setNextObject()
		{
			nextObject = new Timer(1000 + Math.random() * 1000, 1);
			nextObject.addEventListener(TimerEvent.TIMER, newObject);
			nextObject.start();
		}
		
		public function newObject(e:Event)
		{
			var goodObjects:Array = ["Circle1", "Circle2"];
			var badObjects:Array = ["Square1", "Square2"];
			if (Math.random() < .5)
			{
				var r:int = Math.floor(Math.random() * goodObjects.length);
				var classRef:Class = getDefinitionByName(goodObjects[r]) as Class;
				var newObject:MovieClip = new classRef();
				newObject.typestr = "good";
			}
			else
			{
				r = Math.floor(Math.random() * badObjects.length);
				classRef = getDefinitionByName(badObjects[r]) as Class;
				newObject = new classRef();
				newObject.typestr = "bad";
			}
			newObject.x = Math.random() * 500;
			addChild(newObject);
			objects.push(newObject);
			setNextObject();
			
		}
		
		public function moveObjects(e:Event)
		{
			for (var i:int = objects.length - 1; i >= 0; i--)
			{
				objects[i].y += speed;
				if (objects[i].y > 500)
				{
					removeChild(objects[i]);
					objects.splice(i, 1);
				}
					
				if (objects[i].hitTestObject(catcher))
				{
					if (objects[i].typestr == "good")
					{
						score += 5;
					}
					else
					{
						score -= 2;
					}
					if (score < 0) score = 0;
					trace(score);
					scoreDisp.text = score.toString();
					removeChild(objects[i]);
					objects.splice(i, 1);
				}
			}
			catcherNavigate();
		}
		
		private function catcherNavigate()
		{
			if (leftKey)
			{
				catcher.x -= 8;
			}
			if (rightKey)
			{
				catcher.x += 8;
			}
		}
		private function keyUp(e:KeyboardEvent)
		{
			if (e.keyCode == 37)
			{
				leftKey = false;
			}
			if (e.keyCode == 39)
			{
				rightKey = false;
			}
		}
		private function keyDown(e:KeyboardEvent)
		{
			if (e.keyCode == 37)
			{
				leftKey = true;
			}
			if (e.keyCode == 39)
			{
				rightKey = true;
			}
		}
	}
	
}