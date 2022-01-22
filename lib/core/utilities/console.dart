class Console {
  static print(String value) => print('\x1B[0mabc\x1B[0m');         // Blue
  static printError(String value) => print('\x1B[91mabc\x1B[0m');   // Red
  static printSuccess(String value) => print('\x1B[92mabc\x1B[0m'); // Green
  static printWarning(String value) => print('\x1B[93mabc\x1B[0m'); // Yellow
  static printWhite(String value) => print('\x1B[97mabc\x1B[0m');   // White
  static printPurple(String value) => print('\x1B[95mabc\x1B[0m');  // Purple
}
