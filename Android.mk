#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#ifneq ($(TARGET_BUILD_JAVA_SUPPORT_LEVEL),)

LOCAL_PATH := $(call my-dir)


# the permissions
# ============================================================
include $(CLEAR_VARS)

LOCAL_TARGET_DIR := $(TARGET_OUT)/etc/permissions
LOCAL_MODULE := com.quester.android.platform_library.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LOCAL_TARGET_DIR)
LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)


# the library
# ============================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
            $(call all-subdir-java-files)

LOCAL_MODULE_TAGS := optional

# This is the target being built.
LOCAL_MODULE:= com.quester.android.platform_library

LOCAL_PROGUARD_ENABLED := disabled

#
#LOCAL_PROGUARD_ENABLED := full

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

include $(BUILD_JAVA_LIBRARY)

# the documentation
# ============================================================
#include $(CLEAR_VARS)

#LOCAL_SRC_FILES := $(call all-subdir-java-files) $(call all-subdir-html-files)

#LOCAL_MODULE:= platform_library
#LOCAL_DROIDDOC_OPTIONS := com.quester.android.platform_library
#LOCAL_MODULE_CLASS := JAVA_LIBRARIES
#LOCAL_DROIDDOC_USE_STANDARD_DOCLET := true

#include $(BUILD_DROIDDOC)


include $(call all-makefiles-under,$(LOCAL_PATH))

#endif # JAVA_SUPPORT

