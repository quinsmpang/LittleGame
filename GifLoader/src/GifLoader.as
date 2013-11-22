package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FileListEvent;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.net.FileFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class GifLoader extends Sprite
	{
		public var gifParse:GifParse = new GifParse();
		public var openFile:File = new File();
		public var outFile:File = new File();
		public var files:Array = [];
		public var outPath:File;
		
		public var start:TextField = new TextField();
		public var out:TextField = new TextField();
		public var open:TextField = new TextField();
		
		public var progress:TextField = new TextField();
		
		public function GifLoader()
		{
			open.text = "点击打开选择文件";
			open.autoSize = TextFieldAutoSize.CENTER;
			open.border = true;
			open.x = 20;
			open.y = 20;
			addChild(open);
			open.addEventListener(MouseEvent.CLICK,onOpen);
			
			out.text = "点击选择输出目录";
			out.autoSize = TextFieldAutoSize.CENTER;;
			out.border = true;
			out.x = open.x + open.width * 3;
			out.y = 20;
			addChild(out);
			out.addEventListener(MouseEvent.CLICK,onOut);
			
			
			start.text = "点击开始";
			start.x = open.x + open.width + 20;
			start.y = 20;
			start.autoSize = TextFieldAutoSize.CENTER;
			start.border = true;
			addChild(start);
			start.addEventListener(MouseEvent.CLICK,onStart);
			
			addChild(progress);
			progress.x = 20;
			progress.y = open.height + 20;
			progress.height = 200;
			progress.width = 450;
			progress.border = true;
		}
		
		protected function onStart(event:MouseEvent):void
		{
			if(gifParse.hasGif)
			{
			}
			else
			{
				if(files.length && gifParse.outPath)
				{
					start.text = "正在处理";
					progress.text += "开始处理" + files.length + "个gif\n";
					parseGifs();
				}
				else
				{
					
				}
			}
		}
		
		protected function parseGifs():void
		{
			progress.text += "正在处理 " + files[files.length - 1].name + "\n";
			gifParse.pushGif(files.pop());
			gifParse.addEventListener(GifParse.COMPLETE,onGifComplete);
		}
		
		protected function onGifComplete(event:Event):void
		{
			if(files.length)
			{
				parseGifs();
			}
			else
			{
				progress.text += "处理完毕!\n";
				progress.text += "文件位置" + gifParse.outPath.nativePath + "\n";
				start.text = "点击开始！";
			}
		}
		
		protected function onOut(event:MouseEvent):void
		{
			outFile.browseForDirectory("选择输出目录");
			outFile.addEventListener(Event.SELECT,onSelectOut);
		}
		
		protected function onSelectOut(event:Event):void
		{
			outPath = event.target as File;
			gifParse.outPath = outPath;
			progress.text += "输出目录:" + outPath.nativePath + "\n";
		}
		
		protected function onOpen(event:MouseEvent):void
		{
			var gifFilter:FileFilter = new FileFilter("gif","*.gif");
			openFile.browseForOpenMultiple("选择文件",[gifFilter]);	
			openFile.addEventListener(FileListEvent.SELECT_MULTIPLE,onSelected);
		}
		
		protected function onSelected(event:FileListEvent):void
		{
			files = event.files;
			if(files.length)
			{
				progress.text += "选择GIF文件" + files.length + "个\n";
			}
		}
	}
}