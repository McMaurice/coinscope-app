class AppValidators {
  //--AMOUNT TEXTFILED VALIDATOR--
  static String? amount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter amount or zero if unsure';
    }
    final amount = int.tryParse(value);
    if (amount != null && amount > 1000000000) {
      return 'Amount too much';
    }
    return null;
  }

  // ---DESCRIPTION TEXTFILED VALIDATOR--
  static String? description(String? value) {
    if (value != null && value.isNotEmpty && value.length > 150) {
      return 'Description cannot exceed 150 characters';
    }
    return null;
  }

  //---- QUANTITY TEXTFILED VALIDATOR--
  static String? quantity(String? value) {
    if (value == null || value.isEmpty || value == '0') {
      return "Quantity can’t be zero";
    }
    final amount = int.tryParse(value);
    if (amount != null && amount > 1000000) {
      return 'Quantity too large';
    }
    return null;
  }

  //--- NAME TEXTFILED VALIDATOR--
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter product name';
    }
    if (value.length < 3) {
      return 'Name too short for a product';
    }
    return null;
  }
}
