package compoments
{
	import starling.animation.DelayedCall;
	import starling.animation.IAnimatable;
	import starling.animation.Juggler;

	/**
	 *主循环 
	 * @author yanjinwei
	 * 
	 */	
	public class CycleTimer
	{
		private static var _instance:CycleTimer;
		
		public var juggler:Juggler;
		
		public function CycleTimer()
		{
			if(_instance != null)
			{
				throw Error("CycleTimer是单例");
			}
			
			_instance = this;
			juggler = new Juggler();
		}
		
		public static function getInstance():CycleTimer
		{
			if(_instance == null)
			{
				_instance = new CycleTimer();
			}
			
			return _instance;
		}
		
		/**
		 *向juggler 实例中添加一个对象 
		 * @param object :IAnimatable 实现了IAnimatable接口的对象
		 * 
		 */		
		public function add(object:IAnimatable):void
		{
			juggler.add(object);
		}
		/**
		 *在一定的时间内集中处理所有的对象(单位是秒) 
		 * @param time :Number时间（单位是秒）
		 * 
		 */		
		public function advanceTime(time:Number):void
		{
			juggler.advanceTime(time);
		}
		/**
		 *在一定的时间间隔之后执行制定的方法，方法会创建一个DelayedCall实例并返回。<br>
		 * 从juggler中删除这个实例即可取消调用<br> 
		 * @param call :Function 回调的方法
		 * @param delay :Number 延迟时间
		 * @param args ：Arrary 传递给回调方法的参数
		 * @return DelayedCall实例
		 * @see starling.animation.DelayedCall
		 */		
		public function delayCall(call:Function, delay:Number, ...args):DelayedCall
		{
			return juggler.delayCall(call,delay, args) 
		}
		/**
		 *一次性删除所有的对象 
		 * 
		 */		
		public function purge():void
		{
			return juggler.purge();
		}
		/**
		 *从juggler 中删除一个对象 
		 * @param object :IAnimatable 实现了IAnimatable接口的对象
		 * 
		 */		
		public function remove(object:IAnimatable):void
		{
			juggler.remove(object);
		}
		/**
		 *删除一个对象上应用的所有的Tween对象 
		 * @param target :Object 目标对象
		 * 
		 */		
		public function removeTweens(target:Object):void
		{
			juggler.removeTweens(target);
		}
	}
}