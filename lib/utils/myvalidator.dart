String? emailValidator(value) {
  var reg = RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value == null || value.isEmpty) {
    return "This field can't be empty";
  }
  if (!reg.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? passValidator(String? value){
  if (value == null || value.isEmpty) {
    return "This field can't be empty";
  }
  if (value.length < 6) {
    return "Password must have at least 6 characters";
  }
  return null;
}