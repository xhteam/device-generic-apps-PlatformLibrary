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

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

# This is the target being built.
LOCAL_MODULE:= libplatform_library_pcscd_jni

# All of the source files that we will compile.
LOCAL_SRC_FILES:= \
	PlatformLibrary_pcscd.cpp

# All of the shared libraries we link against.
LOCAL_SHARED_LIBRARIES := \
	libnativehelper \
	libcutils \
	libutils

# No static libraries.
LOCAL_STATIC_LIBRARIES :=

# Also need the JNI headers.
LOCAL_C_INCLUDES += \
	$(JNI_H_INCLUDE)

# No specia compiler flags.
LOCAL_CFLAGS +=

include $(BUILD_SHARED_LIBRARY)
