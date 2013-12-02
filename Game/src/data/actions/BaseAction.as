package data.actions
{
	import data.infos.BaseCharacterInfo;

	/**
	 *基础动作类 
	 * @author yanjinwei
	 * 
	 */
	public class BaseAction implements IActionRenderer
	{
		/**
		 *执行动作的人物 
		 */		
		public var character:BaseCharacterInfo;
		
		public function BaseAction(character:BaseCharacterInfo = null)
		{
			this.character = character;
		}
		
		public function start():void
		{
		}
		
		public function stop():void
		{
		}
		
		public function render(isPlay:Boolean):void
		{
		}
		
		public function get gifID():int
		{
			return 0;
		}
	}
}