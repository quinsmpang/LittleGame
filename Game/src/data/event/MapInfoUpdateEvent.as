package data.event
{
	import starling.events.Event;
	
	public class MapInfoUpdateEvent extends Event
	{
		public static const LOCATE_UPDATE:String = "update";
		public static const CHILD_UPDATE:String = "childUpdate";
		
		public function MapInfoUpdateEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}