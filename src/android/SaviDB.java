package com.fatcoder.cordova.savidb;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Context;
import android.content.SharedPreferences;

public class SaviDB extends  CordovaPlugin  {

	SharedPreferences SharedPref;
	SharedPreferences.Editor editor;

	public boolean execute(String action, JSONArray args,
			CallbackContext callbackContext) throws JSONException {
		 SharedPref = cordova.getActivity().getSharedPreferences(
					cordova.getActivity().getPackageName(), Context.MODE_PRIVATE);
		if (action.equalsIgnoreCase("get")) {
			String KeyVal;
			try {
					KeyVal = SharedPref.getString(args.getString(0), null);
					callbackContext.success(KeyVal);
					return true;
			} catch (Exception e) {
				callbackContext.error("Could Not Retreive " + args.getString(0)
						+ e.getMessage());
				return false;
			}

		} else if (action.equalsIgnoreCase("set")) {
			editor = SharedPref.edit();
			try {
				editor.putString(args.getString(0), args.getString(1));
				editor.commit();
			} catch (Exception e) {
				callbackContext.error("Error editing Key " + args.getString(0)
						+ " with value " + args.getString(1) + e.getMessage());
				return false;
			}
			callbackContext.success("Added Value " + args.getString(1)
					+ " to Preferences key " + args.getString(0));
			return true;

		} else if (action.equalsIgnoreCase("remove")) {
			editor = SharedPref.edit();
			try {
				editor.remove(args.getString(0));
				editor.commit();
			} catch (Exception e) {
				callbackContext.error("Error editing Key " + args.getString(0)
						+ " with value " + args.getLong(1) + e.getMessage());
				return false;
			}
			callbackContext.success("Removed Value from Key "
					+ args.getString(0));
			return true;

		} else if (action.equalsIgnoreCase("clear")) {
			editor = SharedPref.edit();
			try {
				editor.clear();
				editor.commit();
			} catch (Exception e) {
				callbackContext.error("Could Not Clear Shared preference File "
						+ e.getMessage());
				return false;
			}
			callbackContext.success("Cleared preference File ");

			return true;
		} else {
			callbackContext.error("error in method");
			return false;
		}
	}
}
