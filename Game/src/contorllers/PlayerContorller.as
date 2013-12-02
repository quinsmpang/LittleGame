package contorllers
{
	import data.actions.Jump;
	import data.actions.LeftMove;
	import data.actions.RightMove;
	import data.actions.Wait;
	import data.infos.RoleInfo;
	
	import starling.core.Starling;
	import starling.events.KeyboardEvent;

	public class PlayerContorller
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
		
		public function PlayerContorller()
		{
			keySlot = new Vector.<int>(SLOTNUM);
		}
		
		public function setController(role:RoleInfo):void
		{
			this.role = role;
			initkey();
		}
		
		private function initkey():void
		{
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
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
		
		private function registerShortCut():void
		{
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
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if(e.keyCode == keySlot[LEFTMOVE])
			{
				role.stopAction(LeftMove);
			}
			else if(e.keyCode == keySlot[RIGHTMOVE])
			{
				role.stopAction(RightMove);
			}
			else if(e.keyCode == keySlot[JUMP])
			{
				role.stopAction(Jump);
			}
			
			role.doAction(Wait);
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if(e.keyCode == keySlot[LEFTMOVE])
			{
				role.doAction(LeftMove);
			}
			else if(e.keyCode == keySlot[RIGHTMOVE])
			{
				role.doAction(RightMove);
			}
			else if(e.keyCode == keySlot[JUMP])
			{
				role.doAction(Jump);
			}
		}
	}
}