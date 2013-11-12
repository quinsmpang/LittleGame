package data.action
{
	import data.BaseCharacterInfo;
	/**
	 * 左移动
	 * @author yanjinwei
	 * 
	 */
	public class LeftMove implements IActionRenderer
	{
		/**
		 *执行动作的人物 
		 */		
		public var character:BaseCharacterInfo;
		
		public function LeftMove()
		{
		}
		
		public function start():void
		{
			if(character != null)
			{
				character.body.vx = -10;
			}
		}
		
		public function stop():void
		{
			if(character != null)
			{
				character.body.vx = 0;
			}
		}
	}
}