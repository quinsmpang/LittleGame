package contorllers
{
	import compoments.CycleTimer;
	
	import data.infos.BaseCharacterInfo;
	import data.infos.RoleInfo;
	
	import starling.animation.IAnimatable;

	/**
	 *键盘手柄<br>
	 * 负责侦听键盘事件并设置baseCharacterInfo的状态 
	 * @author Administrator
	 * 
	 */	
	public class KeyboardPad extends Pad implements IAnimatable
	{
		public static const SLOTNUM:int = 6;
		/**
		 *左移动 
		 */		
		public static const LEFTMOVE:int = 0;
		/**
		 *右移动 
		 */		
		public static const RIGHTMOVE:int = 1;
		/**
		 *跳 
		 */		
		public static const JUMP:int = 2;
		/**
		 *蹲 
		 */		
		public static const CROUCH:int = 3;
		/**
		 *攻击 
		 */		
		public static const ATTACT:int = 4;
		/**
		 *技能0 
		 */		
		public static const SKILL0:int = 5;
		/**
		 *控制器按键插槽 
		 */		
		public var keySlot:Vector.<int>;
		/**
		 *控制的角色 
		 */		
		public var role:RoleInfo;
		
		public function KeyboardPad()
		{
			keySlot = new Vector.<int>(SLOTNUM);
		}
		
		override public function addObject(info:BaseCharacterInfo):void
		{
			const lengthBefore:int = objectInfos.length;
			
			super.addObject(info);
			
			if(lengthBefore == 0)
			{
				CycleTimer.getInstance().renderJuggler.add(this);
			}
		}
		
		override public function removeObject(info:BaseCharacterInfo):void
		{
			super.removeObject(info);
			
			if(objectInfos.length == 0)
			{
				CycleTimer.getInstance().remove(this);
			}
		}
		
		/**
		 *初始化插槽 
		 * @param keys 快捷键数组
		 * 
		 */		
		public function setKeySlot(keys:Array):void
		{
			if(keys.length != keySlot.length)
			{
				throw Error("初始化快捷键数组长度错误！");
			}
			for (var i:int = keys.length - 1 ; i >= 0 ; i --)
			{
				keySlot[i] = keys[i];
			}
		}
		
		/**
		 *设置单个按键插槽 
		 * @param keyType 按键code
		 * @param slot 插槽索引
		 * 
		 */		
		public function setKeySlotAt(keyType:int , slot:int):void
		{
			keySlot[slot] = keyType;
		}
		
		public function advanceTime(time:Number):void
		{
			
		}
	}
}