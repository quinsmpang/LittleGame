package data.actions
{
	import flash.geom.Point;
	
	import data.infos.BaseCharacterInfo;
	
	/**
	 *右移动 
	 * @author yanjinwei
	 * 
	 */
	public class RightMove extends BaseAction
	{
		public function RightMove(character:BaseCharacterInfo = null)
		{
			super(character);
		}
		
		override public function start():void
		{
			if(character != null)
			{
				character.body.vx = 10;
			}
		}
		
		override public function stop():void
		{
			if(character != null)
			{
				character.body.vx = 0;
			}
		}
		
		override public function render(isPlay:Boolean):void
		{
			if(isPlay)
			{
				
			}
			else
			{
				
			}
		}
		
		override public function get gifActionInfo():GIFActionInfo
		{
			var info:GIFActionInfo = new GIFActionInfo();
			info.gifID = 1000;
			info.center = new Point(29,61);
			return info;
		}
		
		
	}
}