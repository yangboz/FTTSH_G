package com.fttsh.apps.mobile.g.views
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.fttsh.apps.mobile.g.Constants;
	import com.fttsh.apps.mobile.g.utils.LogUtil;
	import com.google.maps.Map;
	import com.google.maps.MapEvent;
	import com.google.maps.controls.MapTypeControl;
	import com.google.maps.controls.NavigationControl;
	import com.google.maps.controls.OverviewMapControl;
	import com.google.maps.controls.PositionControl;
	import com.google.maps.controls.ScaleControl;
	import com.google.maps.controls.ZoomControl;
	import com.google.maps.services.ClientGeocoder;
	import com.google.maps.services.GeocodingEvent;
	import com.google.maps.services.GeocodingResponse;
	import com.google.maps.services.Placemark;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.events.ResizeEvent;
	import mx.logging.ILogger;
	
	import org.robotlegs.mvcs.Mediator;
	
	
	/**
	 * SearchMediator.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 25, 2010 5:05:05 PM
	 */   	 
	public class SearchMediator extends Mediator
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Inject]public var view:SearchView;
		
		private var _googleMap:Map;
		private var _geoCode:ClientGeocoder;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(SearchMediator);
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
		public function SearchMediator()
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
			this._googleMap  = new Map();
			this._googleMap.key = Constants.MAP_API_KEY;
			this._googleMap.url = Constants.MAP_API_URL;
			this._googleMap.sensor = Constants.MAP_API_SENSOR;
			this._googleMap.addEventListener(MapEvent.MAP_READY,mapReadyHandler);
			this._googleMap.setSize(new Point(this.view.mapContainer.width,this.view.mapContainer.height));
//			this._googleMap.addControl(new ZoomControl());
			this._googleMap.addControl(new MapTypeControl());
			this._googleMap.addControl(new NavigationControl());
//			this._googleMap.addControl(new OverviewMapControl());
//			this._googleMap.addControl(new ScaleControl());
//			this._googleMap.addControl(new PositionControl());
			
			this.view.mapContainer.addChild(this._googleMap);
		}
		
		override public function onRemove():void
		{
			//
			this._googleMap.removeEventListener(MapEvent.MAP_READY,mapReadyHandler);
			//
			if(this._geoCode)
			{
				this._geoCode.removeEventListener(GeocodingEvent.GEOCODING_SUCCESS,geoCodingSuccessHandler);
				this._geoCode.removeEventListener(GeocodingEvent.GEOCODING_FAILURE,geoCodingFailureHandler);
			}
			//
			this.view.mapContainer.removeEventListener(ResizeEvent.RESIZE,mapContainerResizeHandler);
			//
			this.view.searchBtn.removeEventListener(MouseEvent.CLICK,searchBtnClickHandler);
		}
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		private function mapReadyHandler(event:MapEvent):void
		{
			this._geoCode = new ClientGeocoder();
			this._geoCode.addEventListener(GeocodingEvent.GEOCODING_SUCCESS,geoCodingSuccessHandler);
			this._geoCode.addEventListener(GeocodingEvent.GEOCODING_FAILURE,geoCodingFailureHandler);
			//
			this._geoCode.geocode(this.view.searchTextInput.text);
			//
			this.view.mapContainer.addEventListener(ResizeEvent.RESIZE,mapContainerResizeHandler);
			//
			this.view.searchBtn.addEventListener(MouseEvent.CLICK,searchBtnClickHandler);
		}
		//
		private function geoCodingSuccessHandler(event:GeocodingEvent):void
		{
			var result:Placemark = GeocodingResponse(event.response).placemarks[0];
			this._googleMap.setCenter(result.point,13);
		}
		//
		private function geoCodingFailureHandler(event:GeocodingEvent):void
		{
			LOG.error(event.name,Constants.MSG_ERROR_UNABLE_GEOCODE);
		}
		//
		private function mapContainerResizeHandler(event:ResizeEvent):void
		{
			if(this._googleMap)
			{
				this._googleMap.setSize(new Point(this.view.mapContainer.width,this.view.mapContainer.height));
			}
		}
		//
		private function searchBtnClickHandler(event:MouseEvent):void
		{
			this._geoCode.geocode(this.view.searchTextInput.text);
		}
	}
	
}