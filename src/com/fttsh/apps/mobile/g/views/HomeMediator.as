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
	
	import org.robotlegs.mvcs.Mediator;
	
	
	/**
	 * HomeMediator.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 24, 2010 3:21:45 PM
	 */   	 
	public class HomeMediator extends Mediator
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Inject]public var view:HomeView;
		
		[Inject]public var service:ISqliteService;
		
		
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
		public function HomeMediator()
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
			this.service.load();
			//
			this.addContextListener(SqliteLoadEvent.SQLITE_LOAD_COMPLETE,dataBaseLoadCompleteHandler);
		}
		
		override public function onRemove():void
		{
			//
			this.service.remove(null);
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
		private function dataBaseLoadCompleteHandler(event:SqliteLoadEvent):void
		{
			this.view.homeList.dataProvider = this.model.loadedPOICategorys;
		}
	}
	
}