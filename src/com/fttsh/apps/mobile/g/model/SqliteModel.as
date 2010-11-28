package com.fttsh.apps.mobile.g.model
{
	import com.fttsh.apps.mobile.g.model.vo.NeighborhoodInfo;
	import com.fttsh.apps.mobile.g.model.vo.POICategory;
	import com.fttsh.apps.mobile.g.model.vo.POIImages;
	import com.fttsh.apps.mobile.g.model.vo.POIInfo;
	import com.fttsh.apps.mobile.g.model.vo.POINeighborhood;
	import com.fttsh.apps.mobile.g.model.vo.UserInfo;
	
	import mx.collections.ArrayCollection;

	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * SqliteModel.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 23, 2010 5:15:00 PM
	 */   	 
	[Bindable]
	public class SqliteModel
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		public var loadedNeighborhoodInfos:ArrayCollection;
		
		public var loadedPOICategorys:ArrayCollection;
		
		public var loadedPOIImages:ArrayCollection;
		
		public var loadedPOIInfos:ArrayCollection;
		
		public var loadedPOINeighborhoods:ArrayCollection;
		
		public var loadedUserInfos:ArrayCollection;
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
		     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
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