package data.actions
{
	import data.infos.BaseCharacterInfo;

	public class Wait extends BaseAction
	{
		public function Wait(character:BaseCharacterInfo = null)
		{
			super(character);
		}
		
		override public function get gifID():int
		{
			return 1002;
		}
		
		override public function start():void
		{
		}
		
		override public function stop():void
		{
			super.stop();
		}
		
	}
}