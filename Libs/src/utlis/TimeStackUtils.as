package utlis
{
	import flash.utils.getTimer;

	/**
	 *时间堆栈<br>
	 *计算模版Str内的初始时间与pop的时间差(单位ms)
	 * @author yanjinwei
	 * 
	 */	
	public class TimeStackUtils
	{
		public  var timeStack:Vector.<Array>
		
		public function TimeStackUtils()
		{
			timeStack = new Vector.<Array>;
		}
		
		public function pushTime(str:String = "",isTrace:Boolean = true):void
		{
			timeStack.push(getTime(str));
			if(isTrace)
			{
				trace(str);
			}
		}
		 
		public function getTime(str:String):Array
		{
			var result:Array = [];
			var times:Array = str.match(/\{\d+ms\}/g);
			result.push(str.replace(/\{\d+ms\}/g,""));
			
			if(times)
			{
				var len:int = times.length;
				for (var i:int ; i < len ; i++)
				{
					var timeStr:String = times[i].replace("{","").replace("ms}","");
					result.push(parseInt(timeStr));
				}
				result.push(getTimer());
			}
			return result;
		}
		
		public function popTime(isTrace:Boolean = true):String
		{
			var result:String = "";
			var arr:Array = timeStack.pop();
			if(arr)
			{
				result = "处理后：" + arr[0];
				var pervTime:Number = arr.pop();
				var timeAfter:Number = getTimer() - pervTime;
				var len:int = arr.length;
				for (var i:int = 1 ; i < len ; i ++)
				{
					result += "{" + (arr[i] + timeAfter) +"ms}";
				}
			}
			else
			{
				throw Error("栈内没有存入的时间");
			}
			if(isTrace)
			{
				trace(result);
			}
			return result;
		}
	}
}