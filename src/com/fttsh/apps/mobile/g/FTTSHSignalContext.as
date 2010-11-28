package com.fttsh.apps.mobile.g
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.fttsh.apps.mobile.g.model.SqliteModel;
	import com.fttsh.apps.mobile.g.model.vo.POIInfo;
	import com.fttsh.apps.mobile.g.service.ISqliteService;
	import com.fttsh.apps.mobile.g.service.SqliteService;
	import com.fttsh.apps.mobile.g.views.ApplicationMediator;
	import com.fttsh.apps.mobile.g.views.GuideMediator;
	import com.fttsh.apps.mobile.g.views.GuideView;
	import com.fttsh.apps.mobile.g.views.POIInfoMediator;
	import com.fttsh.apps.mobile.g.views.POIInfoView;
	import com.fttsh.apps.mobile.g.views.SearchMediator;
	import com.fttsh.apps.mobile.g.views.SearchView;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.SignalContext;
	
	/**
	 * FTTSHSignalContext.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 23, 2010 4:54:18 PM
	 */   	 
	public class FTTSHSignalContext extends SignalContext
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
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
		public function FTTSHSignalContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			//TODO: implement function
			super(contextView, autoStartup);
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		override public function startup():void
		{
			//model
			injector.mapSingleton( SqliteModel );
			//signals
			//TODO:triggers the all of Commands
			//
			//services
			injector.mapSingletonOf(ISqliteService,SqliteService);
			
			//commands
			
			//views and mediators
			mediatorMap.mapView(FTTSH_G,ApplicationMediator);
			mediatorMap.mapView(GuideView,GuideMediator);
			mediatorMap.mapView(POIInfoView,POIInfoMediator);
			mediatorMap.mapView(SearchView,SearchMediator);
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
	}
	
}