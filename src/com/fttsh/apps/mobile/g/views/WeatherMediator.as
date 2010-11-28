package com.fttsh.apps.mobile.g.views
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.dj.googleweather.GoogleWeatherService;
	import com.dj.googleweather.data.Weather;
	import com.dj.googleweather.event.GoogleWeatherServiceFaultEvent;
	import com.dj.googleweather.event.GoogleWeatherServiceResultEvent;
	import com.fttsh.apps.mobile.g.Constants;
	import com.fttsh.apps.mobile.g.utils.LogUtil;
	
	import flash.events.MouseEvent;
	
	import mx.logging.ILogger;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;


	/**
	 * WeatherMediator.as class.
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 26, 2010 5:10:08 PM
	 */
	public class WeatherMediator extends Mediator
	{
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var view:WeatherView;

		private var _service:GoogleWeatherService;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		private static const LOG:ILogger=LogUtil.getLogger(WeatherMediator);

		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 

		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//-------------------------------------------------------------------------- 

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		public function WeatherMediator()
		{
			//TODO: implement function
			super();
		}

		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		override public function onRegister():void
		{
			//
			this._service=new GoogleWeatherService();
			//
			this._service.addEventListener(GoogleWeatherServiceResultEvent.RESULT, serviceResultHandler);
			this._service.addEventListener(GoogleWeatherServiceFaultEvent.FAULT, serviceFaultHandler);
			//
			this.getWeather();
		}

		override public function onRemove():void
		{
			if (this._service)
			{
				//
				this._service.removeEventListener(GoogleWeatherServiceResultEvent.RESULT, serviceResultHandler);
				this._service.removeEventListener(GoogleWeatherServiceFaultEvent.FAULT, serviceFaultHandler);
			}
		}

		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		/**
		 * The base URL:
		 * http://www.google.com/ig/api?
		 * This is the base URL which can be extended with the following parameters:
		 *
		 * The Weather parameter:
		 * weather=location
		 * Where location can be either a zip code (weather=24060); city name, state (weather=woodland,PA); city name, country (weather=london,england); or possibly others. Try it out and see what response you get back to test your location.
		 *
		 * The language parameter:
		 * hl=ISO 639-1 Language Code
		 * Please note that changing the language parameter can also alter the units of the data retreived. e.g. degrees will be in celcius
		 * instead of fahrenheit, wind speed will be in kph instead of mph.
		 *				 *
		 * For example, to get the weather for Paris, France in French, one would use the following URL:
		 * http://www.google.com/ig/api?weather=paris,france&hl=fr
		 *
		 * The Google Weather API is not an official public Google API so use it wisely.
		 *
		 * This is unofficial documentation retreived from http://blog.emerick.org/2008/05/07/google-weather-api-feed-documentation/
		 */
		protected function getWeather():void
		{
			//we need to use a proxy in order to avoid flash player security issues
//			var url:String = Settings.PROXY_URL + GoogleWeatherService.BASE_QUERY_URL + "weather=" + city.text + "," + country.text + "&hl=";
			var url:String=Constants.WEATEHR_PROXY_URL + GoogleWeatherService.BASE_QUERY_URL + "weather=" + "Shanghai" + "," + "China" + "&hl=";
			service.getWeather(url); //get the weather from the service
		}

		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		/**
		 * Result handler for the weather service call
		 */
		private function serviceResultHandler(event:GoogleWeatherServiceResultEvent):void
		{
			var weather:Weather=event.data as Weather;

//			forecastInformation.information=weather.forecastInformation;
//			currentCondition.condition=weather.currentCondition;
//
//			forecastCondition1.condition=weather.forecastConditions[0];
//			forecastCondition2.condition=weather.forecastConditions[1];
//			forecastCondition3.condition=weather.forecastConditions[2];
//			forecastCondition4.condition=weather.forecastConditions[3];
		}

		/**
		 * Error handler for the weather service call
		 */
		private function serviceFaultHandler(event:GoogleWeatherServiceFaultEvent):void
		{
			LOG.error(event.errorMessage);
		}
	}

}