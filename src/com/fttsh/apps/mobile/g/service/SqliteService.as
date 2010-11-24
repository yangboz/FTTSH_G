package com.fttsh.apps.mobile.g.service
{
	import com.fttsh.apps.mobile.g.Constants;
	import com.fttsh.apps.mobile.g.model.SqliteModel;
	import com.fttsh.apps.mobile.g.model.vo.NeighborhoodInfo;
	import com.fttsh.apps.mobile.g.utils.ArrayCollectionUtils;
	
	import flash.data.SQLConnection;
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;
	
	import nz.co.codec.flexorm.EntityManager;

	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * SqliteService.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 23, 2010 5:01:10 PM
	 */   	 
	public class SqliteService implements ISqliteService
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var model:SqliteModel;
		
		protected var em:EntityManager = EntityManager.getInstance();
		
		private var sqlConnection:SQLConnection;
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
		public function SqliteService()
		{
			//TODO: implement function
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		public function load():void
		{
			var dbFile:File = File.documentsDirectory.resolvePath(Constants.DB_FILE_PATH);
			this.sqlConnection = new SQLConnection();
			this.sqlConnection.open(dbFile);
			//loadedNeighborhoodInfos
			var findAllResults:ArrayCollection = em.findAll(NeighborhoodInfo);
			//TODO:with custom defined vector template.
//			this.model.loadedNeighborhoodInfos = ArrayCollectionUtils.toVector(findAllResults,NeighborhoodInfo);
			//
			
		}
		
		virtual public function save(value:Object):void
		{
			//TODO: implement function
		}
		
		virtual public function remove(value:Object):void
		{
			//TODO: implement function
		}    
		
		virtual public function findAll():Vector
		{
			//TODO: implement function
			return new Vector();
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