package Loader
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	

	public class AssetLoader
	{
		private var _data:*;
		private var _assetManager:AssetManager;
		private static var _instance:AssetLoader;
		
		public function AssetLoader()
		{
			if(_instance != null)
			{
				throw new Error("only one instance");	
			}
			_assetManager = new AssetManager();
		}
		
		public function maploader(path:String):Image
		{
			var texture:Texture = new Texture();
			var image:Image = new Image(texture);
			_assetManager.enqueue("map\\" + path + ".jpg");
			_assetManager.loadQueue(onComplete);
			function  onComplete(num:Number):void
			{
				if(num ==1)
				{
					image.texture = _assetManager.getTexture(path);
					image.readjustSize();
				}
			}
			return image;
		}
		
		public function getMap(path:String,callBack:Function):void
		{
			var loader:Loader = new Loader();
			loader.load(new URLRequest("map\\" + path));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			function onComplete(event:Event):void
			{
				callBack(event.currentTarget.content);
			}
		}
		
		public static function getloader():AssetLoader
		{
			if(_instance == null)
			{
				_instance = new AssetLoader();
			}
			
			return _instance;
		}
	}
}