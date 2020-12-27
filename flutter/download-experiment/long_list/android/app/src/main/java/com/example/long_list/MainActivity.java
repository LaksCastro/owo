package com.example.long_list;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.Environment;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugins.GeneratedPluginRegistrant;

class MainActivity extends FlutterActivity {
		private static final String DOWNLOAD_PATH_CHANNEL = "samples.flutter.io/download_path";

		@Override
		public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
				new MethodChannel(flutterEngine.getDartExecutor(), DOWNLOAD_PATH_CHANNEL)
						.setMethodCallHandler(new MethodCallHandler() {
								@Override
								public void onMethodCall(MethodCall call, Result result) {
										if (call.method.equals("getDownloadPath")) {
												String downloadPath = getDownloadPath();

												result.success(downloadPath);
										} else {
												result.notImplemented();
										}
								}
						});
		}

		private String getDownloadPath() {
				if (VERSION.SDK_INT >= VERSION_CODES.FROYO) {
//						String downloadPath = getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS).getAbsolutePath();
						String downloadPath = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).getAbsolutePath();

						return downloadPath;
				}

				return null;
		}
}
