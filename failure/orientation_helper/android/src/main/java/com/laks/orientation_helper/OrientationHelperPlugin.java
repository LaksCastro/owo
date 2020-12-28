package com.laks.orientation_helper;

import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Environment;
import android.util.EventLog;
import android.util.Log;
import android.view.Surface;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Handler;
import java.util.logging.StreamHandler;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
	* OrientationHelperPlugin
	*/
public class OrientationHelperPlugin implements FlutterPlugin {
		/// The MethodChannel that will the communication between Flutter and native Android
		///
		/// This local reference serves to register the plugin with the Flutter Engine and unregister it
		/// when the Flutter Engine is detached from the Activity
		private EventChannel eventChannel;

		private SensorHandler sensorHandler;

		@Override
		public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
				eventChannel = new EventChannel(flutterPluginBinding.getBinaryMessenger(), "orientation_helper");
				eventChannel.setStreamHandler(new EventChannel.StreamHandler() {
						private BroadcastReceiver chargingStateChangeReceiver;

						private SensorManager sensorManager;
						private Sensor orientation;

						private float value0 = -10000;
						private float value1 = -10000;

						private final SensorEventListener orientationSensorListener = new SensorEventListener() {
								int orientation = -1;

								@Override
								public void onSensorChanged(SensorEvent event) {
										SensorHandler.onSensorChanged(event);

										int value;

										if (value0 == event.values[0] && value1 == event.values[1]) {
												return;
										}
//            Log.d("values:", "values:" + event.values[0]+", "+event.values[1]);
										if (event.values[1] > 0 && event.values[0] == 0) {
												value = Surface.ROTATION_0;//portrait
												if (orientation != value) {
														updateImageRotation(value);
														Log.d("orientation", "portrait  + update");
												}
												orientation = value;
												Log.d("orientation", "portrait ");
										}


										if (event.values[1] < 0 && event.values[0] == 0) {
												value = Surface.ROTATION_180;//portrait reverse
												if (orientation != value) {
														updateImageRotation(value);
														Log.d("orientation", "portrait reverse + update");
												}
												orientation = value;
												Log.d("orientation", "portrait reverse");
										}

										if (event.values[0] > 0 && event.values[1] == 0) {
												value = Surface.ROTATION_90;//portrait reverse
												if (orientation != value) {
														updateImageRotation(value);
														Log.d("orientation", "landscape  + update");
												}
												orientation = value;
												Log.d("orientation", "landscape");
										}

										if (event.values[0] < 0 && event.values[1] == 0) {
												value = Surface.ROTATION_270;//portrait reverse
												if (orientation != value) {
														updateImageRotation(value);
														Log.d("orientation", "landscape  + update");
												}
												orientation = value;
												Log.d("orientation", "landscape reverse");
										}

										value0 = event.values[0];
										value1 = event.values[1];
								}

								@Override
								public void onAccuracyChanged(Sensor sensor, int accuracy) {
										sensor.g
								}
						};
						@Override
						public void onListen(Object listener, EventChannel.EventSink eventSink) {
								startListening(listener, eventSink);
						}

						@Override
						public void onCancel(Object listener) {
								cancelListening(listener);
						}

						void startListening(Object listener, EventChannel.EventSink eventSink) {
								eventSink.success();
						}

						void cancelListening(Object listener) {
								listeners.remove(listener);
						}
				});
		}

		@Override
		public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
				methodChannel.setMethodCallHandler(null);

				sensorHandler
		}
}
