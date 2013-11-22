package
{
	import flash.display.BitmapData;
	import flash.display.PNGEncoderOptions;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import org.bytearray.gif.events.GIFPlayerEvent;
	import org.bytearray.gif.player.GIFPlayer;

	public class GifParse extends EventDispatcher
	{
		public var gifPlayer:GIFPlayer = new GIFPlayer(false);
		public var outPath:File;
		private var name:String;
		private var fileStream:FileStream;
		
		public var hasGif:Boolean;
		
		public static const COMPLETE:String = "complete";
		
		public function GifParse()
		{
			super();
			fileStream = new FileStream();
		}
		
		public function pushGif(file:File):void
		{
			name = file.name.replace(".gif","");
			gifPlayer.load(new URLRequest(file.url));
			gifPlayer.addEventListener(GIFPlayerEvent.COMPLETE,onComplete);
			
			hasGif = true;
		}
		
		protected function onComplete(event:Event):void
		{
			var len:int = gifPlayer.frames.length;
			var file:File;
			for(var i:int = 1 ; i <= len ; i++)
			{
				var path:String = outPath.url +"/" + name + "/"+ i + ".png";
				file = new File(path);
				fileStream.open(file,FileMode.WRITE);
				gifPlayer.gotoAndStop(i);
				var data:BitmapData = gifPlayer.bitmapData;
				var bits:ByteArray = data.encode(data.rect,new PNGEncoderOptions())
				fileStream.writeBytes(bits);
				fileStream.close();
			}
			hasGif = false;
			dispatchEvent(new Event(COMPLETE));
		}
	}
}