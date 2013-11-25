package data.infos
{
	import flash.geom.Rectangle;
	
	import compoments.Box2D;
	
	import renderers.RoleRenderer;

	public class RoleInfo extends BaseCharacterInfo
	{
		public var name:String;
		
		public function RoleInfo()
		{
			super();
		}
		
		override public function get rendererClass():Class
		{
			return RoleRenderer;
		}
		
		override public function hitTest(object:Box2D, hitRectangle:Rectangle):void
		{
			trace(name + "被打了");
		}
	}
}