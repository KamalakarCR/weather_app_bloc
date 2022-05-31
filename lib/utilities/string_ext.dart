extension ExtString on String {
  bool get isZipValid {
    final zipRegExp = RegExp(r'^[1-9]{1}[0-9]{2}[0-9]{3}$');
    return zipRegExp.hasMatch(this);
  }
}
