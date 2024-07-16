enum StorageKeyEnum {
  isLogin,
  accessToken,
}

extension StorageKeyEnumExt on StorageKeyEnum {
  String get name {
    switch (this) {
      case StorageKeyEnum.isLogin:
        return 'is_login';
      case StorageKeyEnum.accessToken:
        return 'access_token';
    }
  }
}
