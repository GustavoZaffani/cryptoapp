import 'package:cryptoapp/controllers/utils.dart';
import 'package:flutter/services.dart';

class DeviceInfoController {
  static const platform = MethodChannel("br.com.utfpr.cryptoapp/deviceInfo");

  Future<void> getDeviceInfo({
    required OnSuccessCallback<String> onSuccess,
    required OnErrorCallback onError,
  }) async {
    try {
      onSuccess(await platform.invokeMethod("getDeviceInfo"));
    } on PlatformException catch (e) {
      onError("Erro ao obter as informações do dispositivo: ${e.message}");
    }
  }
}
