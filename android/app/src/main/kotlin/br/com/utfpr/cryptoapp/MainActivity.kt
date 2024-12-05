package br.com.utfpr.cryptoapp

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val CHANNEL = "br.com.utfpr.cryptoapp/deviceInfo"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceInfo") {
                val deviceModel = getDeviceInfo()
                result.success(deviceModel)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceInfo(): String {
        val deviceInfo = mutableMapOf<String, String>()

        deviceInfo["Modelo do Dispositivo"] = Build.MODEL
        deviceInfo["Versão do Android"] = Build.VERSION.RELEASE
        deviceInfo["Fabricante"] = Build.MANUFACTURER
        deviceInfo["Marca do Dispositivo"] = Build.BRAND
        deviceInfo["Nome do Dispositivo"] = Build.DEVICE
        deviceInfo["Versão da SDK"] = Build.VERSION.SDK_INT.toString()

        return deviceInfo.entries.joinToString(separator = "\n") {
            "${it.key}: ${it.value}"
        }
    }
}