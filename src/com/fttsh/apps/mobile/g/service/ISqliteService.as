package com.fttsh.apps.mobile.g.service
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * ISqliteService.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 23, 2010 4:59:18 PM
	 */ 
	public interface ISqliteService
	{
		function load():void;
		function save(value:Object):void;
		function remove(value:Object):void;
		function findAll():Vector;
	}
}