package data.event
{
	import starling.events.Event;
	
	public class MapInfoUpdateEvent extends Event
	{
		public static const UPDATE:String = "update";
		
		public function MapInfoUpdateEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}