package com.example.camera_project_example

import android.content.Intent
import android.graphics.Bitmap
import android.os.Build
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {
    val _requestCode = 1888;
    var pictureBytes: ByteArray? = null
    lateinit var _result:  MethodChannel.Result


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "camera_project").setMethodCallHandler { call, result ->
            _result = result
            when (call.method) {
                "getPlatformVersion" -> {
                    result.success("Android ${Build.VERSION.RELEASE}")
                }
                "openCamera" -> {
                    val intent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
                    startActivityForResult(intent, _requestCode)
                }
                else -> {
                    result.notImplemented()
                }
            }

        }
        super.configureFlutterEngine(flutterEngine);
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == _requestCode && resultCode == RESULT_OK) {
            val bitmap = data?.extras?.get("data") as Bitmap
            val stream = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream)
            pictureBytes = stream.toByteArray()
            bitmap.recycle()
            _result.success(pictureBytes)
        }
        super.onActivityResult(requestCode, resultCode, data)
    }
}
