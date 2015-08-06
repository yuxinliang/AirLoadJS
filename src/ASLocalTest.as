package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.html.HTMLLoader;
	import flash.net.URLRequest;
	
	public class ASLocalTest extends Sprite
	{
		public function ASLocalTest()
		{
			addEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
		}
		private function addToStageHandler(e:Event):void
		{
			this.graphics.beginFill(0xFF00FF);
			this.graphics.drawRect(0,0,100,100);
			this.graphics.endFill();
			startReadJs();
		}
		private var html:HTMLLoader = new HTMLLoader(); 
		private var urlReq:URLRequest = new URLRequest("assets/test.html"); 
		private function startReadJs():void
		{
			html.addEventListener(Event.COMPLETE, loadComplete); 
			html.load(urlReq); 
		}
		private function loadComplete(e:Event):void{ 
			trace(html.window.getDBData("一条弯弯的河"));
		}
	}
}