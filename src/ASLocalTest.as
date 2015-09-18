package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.html.HTMLLoader;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
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
			//startReadJs();
			evalFunction();
		}
		public var jsClass:Object;
		private var htmlLoader:HTMLLoader=new HTMLLoader(); 
		private var urlReq:URLRequest = new URLRequest("assets/test.html"); 
		private var jsUrl:URLRequest = new URLRequest("assets/test.js");
		private function startReadJs():void
		{
			htmlLoader.addEventListener(Event.COMPLETE, loadComplete); 
			htmlLoader.load(urlReq); 
		}
		private function loadComplete(e:Event):void{ 
			trace(htmlLoader.window.getDBData("一条弯弯的河"));
		}
		private function evalFunction():void
		{
			var jsLoader:URLLoader = new URLLoader();
			jsLoader.addEventListener(Event.COMPLETE,jsLoadComplete);
			jsLoader.dataFormat=URLLoaderDataFormat.TEXT; 
			jsLoader.load(jsUrl);
		}
		private function jsLoadComplete(e:Event):void
		{
			var jsStr:String = e.currentTarget.data as String;
			htmlLoader.window.eval(jsStr);
			jsClass = new htmlLoader.window.test();
			trace(jsClass.run())
		}
	}
}