package compoments
{
	import flash.geom.Rectangle;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;

	/**
	 *盒子的世界<br>
	 * 实现世界内的盒子以及盒子之间的物理效果<br>
	 * addChild方法添加盒子
	 * @see Box2D
	 * @author yanjinwei
	 * 
	 */	
	public class BoxWorld2D implements IAnimatable
	{
		private static var _instance:BoxWorld2D;
		
		public var boxs:Vector.<Box2D>;
		
		public function BoxWorld2D()
		{
			if(_instance != null)
			{
				throw Error("实例化多个单例");
			}
			_instance = this;
			boxs = new Vector.<Box2D>;
		}
		/**
		 *添加盒子 
		 * @param box
		 * @return 添加的盒子引用
		 */		
		public function addChild(box:Box2D):Box2D
		{
			boxs.push(box);
			return box;
		}
		/**
		 *移除盒子 
		 * @param box
		 * @return 移除盒子的引用 
		 */		
		public function removeChild(box:Box2D):Box2D
		{
			var index:int = boxs.indexOf(box);
			if(index != -1)
			{
				boxs.splice(index,1);
				return box;
			}
			else
			{
				return null;
			}
		}
		/**
		 *开始模拟物理环境 
		 */		
		public function start():void
		{
			CycleTimer.getInstance().juggler.add(this);
		}
		/**
		 * 停止物理环境的模拟
		 */		
		public function stop():void
		{
			CycleTimer.getInstance().juggler.remove(this);
		}
		/**
		 *对world内所有add的盒子进行碰撞检测 
		 * @param time
		 */		
		public function advanceTime(time:Number):void
		{
			var len:int = boxs.length;
			for(var i:int ; i < len ; i++)
			{
				for(var j:int = len -1 ; j > i ; j--)
				{
					var hitRectangle:Rectangle = boxs[i].body.intersection(boxs[j]);
					if(hitRectangle.height == 0 && hitRectangle.width == 0)
					{
						break;
					}
					else
					{
						boxs[i].hitTest(boxs[j], hitRectangle);
						boxs[j].hitTest(boxs[i], hitRectangle);
					}
				}
				moveBox(boxs[i]);
			}
		}
		
		[Inline]
		final private function moveBox(box:Box2D):void
		{
			box.vx += box.ax;
			box.vy += box.ay;
			box.x += box.vx;
			box.y += box.vy;
		}
		
		public static function getInstance():BoxWorld2D
		{
			if(_instance == null)
			{
				_instance = new BoxWorld2D();
			}
			return _instance;
		}
	}
}