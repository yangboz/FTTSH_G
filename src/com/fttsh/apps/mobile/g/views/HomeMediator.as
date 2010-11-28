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
	
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.IndexChangeEvent;
	
	
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
			this.view.systemManager.stage.addEventListener(KeyboardEvent.KEY_UP, deviceKeyUpHandler);
			//add the first view when this view is created
			this.view.myNavigator.pushView(GuideView);
			//
			this.view.bottomTabBar.addEventListener(IndexChangeEvent.CHANGE,bottomTabBar_changeHandler);
		}
		
		override public function onRemove():void
		{
			//
			this.view.systemManager.stage.removeEventListener(KeyboardEvent.KEY_UP, deviceKeyUpHandler);
			//
			this.view.bottomTabBar.removeEventListener(IndexChangeEvent.CHANGE,bottomTabBar_changeHandler);
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
		//this is required to handle the device back key
		protected function deviceKeyUpHandler(event:KeyboardEvent):void 
		{
			// TODO Auto-generated method stub
			var key:uint = event.keyCode;
			
			if (key == Keyboard.BACK && this.view.myNavigator.navigationStack.length > 1){
				this.view.myNavigator.popView();
			}
		}
		//
		protected function bottomTabBar_changeHandler(event:IndexChangeEvent):void
		{
			// TODO Auto-generated method stub
			switch(this.view.bottomTabBar.selectedIndex)
			{
				case 0:
					if (!(this.view.myNavigator.activeView is GuideView))
						this.view.myNavigator.pushView(GuideView);
					break;
				case 1:
					if (!(this.view.myNavigator.activeView is NearByView))
						this.view.myNavigator.pushView(NearByView);
					break;
				case 2:
					if (!(this.view.myNavigator.activeView is SearchView))
						this.view.myNavigator.pushView(SearchView);
					break;
				case 3:
					if (!(this.view.myNavigator.activeView is FavoritesView))
						this.view.myNavigator.pushView(FavoritesView);
					break;
				case 4:
					if (!(this.view.myNavigator.activeView is LocationView))
						this.view.myNavigator.pushView(LocationView);
					break;
				default:
					break;
			}
		}
	}
	
}