typedef OnSuccessCallback<T> = void Function(T data);
typedef OnSuccessNoContentCallback<T> = void Function();
typedef OnErrorCallback = void Function(String error);
typedef OnLoadingCallback = void Function();
typedef OnFinallyCallback = void Function();
