package com.bannershallmark.util;

/**
 * @author Niravdas
 */
final public class Constants {
	public class Messages {
		public static final String PERMISSION_DENIED = "You don't have permission for this action.";
		public static final String NO_STORE_ASSIGNED = "You can't access this tab until a Store is Assigned to your User.";
	}

	public class AttributeNames {
		public static final String MESSAGE = "msg";
		public static final String SUCCESS_MESSAGE = "successMsg";
	}

	public class ShipmentCheckIns {
		public static final String WITH_HUNDRED_PERCENT = "The order was checked in 100% per the packing slip";
	}

	public class PaginationParameters {
		public static final String SORTING_ORDER = "order[0][dir]";
		public static final String SORTING_COLUMN = "order[0][column]";
		public static final String SEARCH_VALUE = "search[value]";
		public static final String DRAW = "draw";
		public static final String START = "start";
		public static final String LENGTH= "length";
	}

	/**
	 * Used to set environment(Local, Live and Development) of project.
	 */
	public static class Development {
		/**
		 * Make ON_SERVER = Boolean.TRUE when building war to deploy on server.
		 * Must keep ON_SERVER = Boolean.FALSE when running on local machine.
		 */
		public static final Boolean ON_SERVER = Boolean.TRUE;
		public static final String LIVE_URL = "/Bannershallmark";
		public static final String DEV_URL  = "/Bannershallmark2";
	}
}
