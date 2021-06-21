extension CustomString on String {
  bool toBoolean() {
    return this.trim().toLowerCase() == "true";
  }
}
