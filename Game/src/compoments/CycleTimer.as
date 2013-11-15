package compoments
{
	import starling.animation.DelayedCall;
	import starling.animation.IAnimatable;
	import starling.animation.Juggler;
	import starling.core.Starling;

	/**
	 *主循环 
	 * @author yanjinwei
	 * 
	 */	
	public class CycleTimer
	{
		private static var _instance:CycleTimer;
		
		/**
		 *物理循环 
		 */		
		public var physicalJuggler:Juggler;
		/**
		 *渲染循环 
		 */		
		public var renderJuggler:Juggler;
		
		public function CycleTimer()
		{
			if(_instance != null)
			{
				throw Error("CycleTimer是单例");
			}
			
			_instance = this;
			physicalJuggler = new Juggler();
			renderJuggler = new Juggler();
		}
		
		public static function getInstance():CycleTimer
		{
			if(_instance == null)
			{
				_instance = new CycleTimer();
			}
			
			return _instance;
		}
		
		public function start():void
		{
			Starling.juggler.add(renderJuggler);
			Starling.juggler.add(physicalJuggler);
		}
		
		public function stop():void
		{
			Starling.juggler.remove(renderJuggler);
			Starling.juggler.remove(physicalJuggler);
		}
		
		/**
		 *向juggler 实例中添加一个对象 
		 * @param object :IAnimatable 实现了IAnimatable接口的对象
		 * 
		 */		
		public function add(object:IAnimatable):void
		{
			physicalJuggler.add(object);
		}
		/**
		 *在一定的时间内集中处理所有的对象(单位是秒) 
		 * @param time :Number时间（单位是秒）
		 * 
		 */		
		public function advanceTime(time:Number):void
		{
			physicalJuggler.advanceTime(time);
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
			return physicalJuggler.delayCall(call,delay, args) 
		}
		/**
		 *一次性删除所有的对象 
		 * 
		 */		
		public function purge():void
		{
			return physicalJuggler.purge();
		}
		/**
		 *从juggler 中删除一个对象 
		 * @param object :IAnimatable 实现了IAnimatable接口的对象
		 * 
		 */		
		public function remove(object:IAnimatable):void
		{
			physicalJuggler.remove(object);
		}
		/**
		 *删除一个对象上应用的所有的Tween对象 
		 * @param target :Object 目标对象
		 * 
		 */		
		public function removeTweens(target:Object):void
		{
			physicalJuggler.removeTweens(target);
		}
	}
}