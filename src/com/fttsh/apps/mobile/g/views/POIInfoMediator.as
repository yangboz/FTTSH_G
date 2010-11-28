package com.fttsh.apps.mobile.g.views
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.fttsh.apps.mobile.g.model.SqliteModel;
	
	import flash.events.MouseEvent;
	
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.mvcs.Mediator;
	
	
	/**
	 * POIInfoMediator.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 25, 2010 3:01:08 PM
	 */   	 
	public class POIInfoMediator extends Mediator
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		[Inject]public var view:POIInfoView;
		
		[Inject]public var model:SqliteModel;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		
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
		public function POIInfoMediator()
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
			this.model.loadedPOIInfos.filterFunction = poiInfoFilter;
			this.view.infoTextArea.text = ObjectUtil.toString(this.model.loadedPOIInfos);
			//
			this.view.homeBtn.addEventListener(MouseEvent.CLICK,homeBtnClickHandler);
		}
		//
		override public function onRemove():void
		{
			//
			if(this.view.homeBtn.hasEventListener(MouseEvent.CLICK))
			{
				this.view.homeBtn.removeEventListener(MouseEvent.CLICK,homeBtnClickHandler);
			}
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
		private function homeBtnClickHandler(event:MouseEvent):void
		{
			this.view.navigator.popToFirstView();
		}
		//
		private function poiInfoFilter(item:Object):Boolean
		{
			if(item["POICategoryID"]==this.view.data["POICategoryID"])
			{
				return true;
			}
			return false;
		}
	}
	
}