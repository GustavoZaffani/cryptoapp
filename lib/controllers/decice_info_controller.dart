import 'package:cryptoapp/controllers/utils.dart';
import 'package:flutter/services.dart';

class DeviceInfoController {
  static const platform = MethodChannel("br.com.utfpr.cryptoapp/deviceInfo");

  Future<void> getDeviceInfo({
    required OnSuccessCallback<String> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();
      onSuccess(await platform.invokeMethod("getDeviceInfo"));
    } on PlatformException catch (e) {
      onError("Erro ao obter as informações do dispositivo: ${e.message}");
    } finally {
      onFinally();
    }
  }
}
