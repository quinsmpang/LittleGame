package Loader
{
	import flash.net.URLRequest;
	
	import compoments.GIFAnimation;

	public class GIFLoader
	{
		/**
		 *资源队列 
		 */		
		public var queue:Array;
		
		/**
		 *当前处理的资源 
		 */		
		public var currentAsset:Asset;
		/**
		 * GIF资源加载
		 */		
		
		private static var _instance:GIFLoader;
		
		public function GIFLoader()
		{
			if(_instance != null)
			{
				throw Error("实例多个单例");
			}
			
			_instance = this;
			queue = [];
		}
		
		public static function get instance():GIFLoader
		{
			if(_instance == null)
			{
				_instance = new GIFLoader();
			}
			
			return _instance;
		}
		
		/**
		 *加载id对应的GIF动画 
		 * @param id
		 * 
		 */		
		public function load(id:int):GIFAnimation
		{
			var gif:GIFAnimation = new GIFAnimation(true);
			var asset:Asset = new Asset();
			asset.type = GIFAnimation;
			asset.url = "gif\\" + id + ".gif";
			asset.asset = gif;
			enqueue(asset);
			return gif;
		}
		
		protected function enqueue(asset:Asset):void
		{
			queue.push(asset);
			
			if(queue)
			{
				loadAsset();
			}
		}
		
		/**
		 *资源加载 
		 */		
		protected function loadAsset():void
		{
			currentAsset = queue.pop();
			var url:URLRequest = new URLRequest(currentAsset.url);
			(currentAsset.asset as GIFAnimation).load(url).complete.add(complete);
		}
		
		protected function complete(isSuccess:Boolean):void
		{
			if(isSuccess)
			{
			}
			else
			{
				
			}
			
			if(queue.length)
			{
				loadAsset();
			}
			else
			{
				currentAsset = null;
			}
		}
	}
}