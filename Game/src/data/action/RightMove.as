package data.action
{
	import data.info.BaseCharacterInfo;
	/**
	 *右移动 
	 * @author yanjinwei
	 * 
	 */
	public class RightMove implements IActionRenderer
	{
		/**
		 *执行动作的人物 
		 */		
		public var character:BaseCharacterInfo;
		
		public function RightMove()
		{
		}
		
		public function start():void
		{
			if(character != null)
			{
				character.body.vx = 10;
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