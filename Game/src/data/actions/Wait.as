package data.actions
{
	import flash.geom.Point;
	
	import data.infos.BaseCharacterInfo;

	public class Wait extends BaseAction
	{
		public function Wait(character:BaseCharacterInfo = null)
		{
			super(character);
		}
		
		override public function start():void
		{
		}
		
		override public function stop():void
		{
			super.stop();
		}
		
		override public function get gifActionInfo():GIFActionInfo
		{
			var info:GIFActionInfo = new GIFActionInfo();
			info.gifID = 1002;
			info.center = new Point(34,49);
			return info;
		}
	}
}