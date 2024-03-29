package compoments
{
	import flash.geom.Rectangle;
	
	import starling.animation.IAnimatable;

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
		public static const UP:int = 0;
		public static const BOTTOM:int = 1;
		public static const LEFT:int = 2;
		public static const RIGHT:int = 3;
		
		private static var _instance:BoxWorld2D;
		
		/**
		 *边界碰撞误差 
		 */		
		public static var boundaryHitOffset:Number = 0;
		
		/**
		 *重力 
		 */		
		public var gravity:Number = 2;
		
		public var boundary:Box2D;
		
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
			CycleTimer.getInstance().physicalJuggler.add(this);
		}
		/**
		 * 停止物理环境的模拟
		 */		
		public function stop():void
		{
			CycleTimer.getInstance().physicalJuggler.remove(this);
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
					var hitRectangle:Rectangle = boxs[i].body.intersection(boxs[j].body);
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
		
		private function moveBox(box:Box2D):void
		{
			box.vx += box.ax;
			box.vy += box.ay + gravity;
			box.x += box.vx;
			box.y += box.vy;
			
			//越界碰撞测试
			//左触界
			if(box.x < boundary.x - boundaryHitOffset)
			{
				box.x -= box.vx;
				box.vx -= box.ax;
				box.vx = box.ax = 0;
				box.hitBoundary(LEFT);
			}
			//右触界
			if(box.body.right > boundary.body.right + boundaryHitOffset)
			{
				box.x -= box.vx;
				box.vx -= box.ax;
				box.vx = box.ax = 0;
				box.hitBoundary(RIGHT);
			}
			//下触界
			if(box.body.bottom > boundary.body.bottom + boundaryHitOffset)
			{
				box.y -= box.vy;
				box.vy -= box.ay;
				box.vy = box.ay = 0;
				box.hitBoundary(BOTTOM);
			}
			//上触界
			if(box.y < boundary.y - boundaryHitOffset)
			{
				box.hitBoundary(UP);
			}
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