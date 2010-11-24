package com.fttsh.apps.mobile.g.utils
{
	import mx.logging.ILogger;
	import mx.logging.Log;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Use a simple utility method to retrieve the loggerfor a particular class, 
	 * instead of passing in the qualified class name as a string.</br>
	 *
	 * <b>Example:</b></br>(Declare Loggers as Static Constants)
	 * private static const LOG:ILogger = LogUtil.getLogger(MyClass);</br>
	 *
	 * <b>Format Log Statements Consistently:</b></br>
	 * LOG.error("Something bad has happened: event={0}, message={1}", event.type, message);</br>
	 *
	 * <b>Parameterize Log Statements:</b></br>
	 * LOG.error("Something bad has happened: event={0}, message={1}", event.type, message);</br>
	 *
	 * <b>Use Log Levels to Indicate Severity:</b></br>
	 * LOG.error("The service has failed and no data is available.");</br>
	 *
	 * <b>Use Log Filters for Focus:</b></br>
	 * target.filters = [ "my.important.package.MyClass" ];</br>
	 * target.level = LogEventLevel.INFO;</br>
	 *
	 * <b>Include Categories to Show Class Names:</b></br>
	 * target.includeCategory = true;</br>
	 *
	 * @see
	 * http://blogs.adobe.com/tomsugden/2009/08/
	 *
	 * @author Knight.zhou
	 */
	public class LogUtil 
	{
		/**
		 * With the utility method approach,the class name can be refactored
		 * without needing to edit the string.</br>
		 * Here is an implementation for the LogUtil.getLogger() method:</br>
		 *
		 * @param class category
		 * @return ILogger
		 *
		 */
		public static function getLogger(c:Class):ILogger {
			var className:String =getQualifiedClassName(c).replace("::", ".");
			return Log.getLogger(className);
		}
	}
}