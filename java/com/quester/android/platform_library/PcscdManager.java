package com.quester.android.platform_library;

import android.util.Log;

public final class PcscdManager {    
	
    static {
        /*
         * Load the library.  If it's already loaded, this does nothing.
         */
        System.loadLibrary("platform_library_pcscd_jni");
    }
    public PcscdManager() {}

	/**
	 * Start pcscd service
	 * @return true if start pcscd service success, false otherwise
	 */
	public boolean startService() {
		return (nativeStartService() == 0) ? true : false;
	}

	/**
	 * Stop pcscd service
	 * @return true if stop pcscd service success, false otherwise
	 */
	public boolean stopService() {
		return (nativeStopService() == 0) ? true : false;
	}

	// native methods
    native private int nativeStartService();
	native private int nativeStopService();
}
