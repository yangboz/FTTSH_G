package com.fttsh.apps.mobile.g.views
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.fttsh.apps.mobile.g.events.SqliteLoadEvent;
	import com.fttsh.apps.mobile.g.model.SqliteModel;
	import com.fttsh.apps.mobile.g.service.ISqliteService;
	import com.fttsh.apps.mobile.g.views.components.InformationBox;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import org.robotlegs.mvcs.Mediator;


	/**
	 * GuideMediator.as class.
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 24, 2010 3:21:45 PM
	 */
	public class GuideMediator extends Mediator
	{
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var view:GuideView;

		[Inject]
		public var model:SqliteModel;

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
		public function GuideMediator()
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
			this.addContextListener(SqliteLoadEvent.SQLITE_LOAD_COMPLETE, dataBaseLoadCompleteHandler);
			//
			this.addViewListener(FlexEvent.VIEW_ACTIVATE, viewActiveHandler);
			//
			this.view.infoBtn.addEventListener(MouseEvent.CLICK, infoBtnClickHandler);
		}

		override public function onRemove():void
		{
			if (this.view.list.hasEventListener(MouseEvent.CLICK))
			{
				this.view.list.removeEventListener(MouseEvent.CLICK, listMouseClickHandler);
			}
			//
			this.view.infoBtn.removeEventListener(MouseEvent.CLICK, infoBtnClickHandler);
			//
			this.view.weatherBtn.removeEventListener(MouseEvent.CLICK,weatherBtnClickHandler);
		}

		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		protected function listInitialization():void
		{
			this.view.list.dataProvider=this.model.loadedPOICategorys;
			this.view.list.labelField="POICategoryNameEnglish";
			this.view.list.addEventListener(MouseEvent.CLICK, listMouseClickHandler);
			this.view.weatherBtn.addEventListener(MouseEvent.CLICK,weatherBtnClickHandler);
		}

		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		private function dataBaseLoadCompleteHandler(event:SqliteLoadEvent):void
		{
			this.listInitialization();
		}

		private function listMouseClickHandler(event:MouseEvent):void
		{
			this.view.navigator.pushView(POIInfoView, this.view.list.selectedItem);
		}

		private function viewActiveHandler(event:FlexEvent):void
		{
			this.listInitialization();
		}

		//
		private function infoBtnClickHandler(event:MouseEvent):void
		{
			InformationBox.show(this.view, InformationBox.IC_INFO, "About FTTSH", 
				"FTTSH is the abbreviation of 'first time to shanghai', this is a 'Shanghai Travel Guide' APP which installed on iphone && android.\nCopyright 2010 by FTTSH Productions\nAll Rights Reserved. "
			);
		}
		//
		private function weatherBtnClickHandler(event:MouseEvent):void
		{
			WeatherView.show(this.view);
		}

	}

}