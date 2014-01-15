#define LOG_TAG "platformlibrary"
#include "utils/Log.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cutils/properties.h>
#include <unistd.h>
#include <fcntl.h>
#include "JNIHelp.h"
#include "android_runtime/AndroidRuntime.h"

#include "jni.h"

namespace android {

extern int register_com_quester_android_PlatformLibrary_scard_SCardManager(JNIEnv* env);
extern int register_com_quester_android_PlatformLibrary_SCardManager(JNIEnv* env);

}


#ifdef NDEBUG
    #define REG_JNI(name)      { name }
    struct RegJNIRec {
        int (*mProc)(JNIEnv*);
    };
#else
    #define REG_JNI(name)      { name, #name }
    struct RegJNIRec {
        int (*mProc)(JNIEnv*);
        const char* mName;
    };
#endif

static int register_jni_procs(const RegJNIRec array[], size_t count, JNIEnv* env)
{
    for (size_t i = 0; i < count; i++) {
        if (array[i].mProc(env) < 0) {
#ifndef NDEBUG
            ALOGD("----------!!! %s failed to load\n", array[i].mName);
#endif
            return -1;
        }
    }
    return 0;
}


static const RegJNIRec gPlatformRegJNI[] = {
    REG_JNI(android::register_com_quester_android_PlatformLibrary_scard_SCardManager),
	REG_JNI(android::register_com_quester_android_PlatformLibrary_SCardManager),		
};


/*
 * This is called by the VM when the shared library is first loaded.
 */
jint JNI_OnLoad(JavaVM* vm, void* reserved) {
    JNIEnv* env = NULL;
    jint result = -1;

    if (vm->GetEnv((void**) &env, JNI_VERSION_1_4) != JNI_OK) {
        ALOGE("ERROR: GetEnv failed\n");
        goto bail;
    }
    assert(env != NULL);

	ALOGD("Loading platform library class\n");

    if (register_jni_procs(gPlatformRegJNI, sizeof(gPlatformRegJNI)/sizeof(gPlatformRegJNI[0]), env) != 0) {
        ALOGE("ERROR: PlatformLibrary native registration failed\n");
        goto bail;
    }

    /* success -- return valid version number */
    result = JNI_VERSION_1_4;

bail:
    return result;
}

