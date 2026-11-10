const minimumAuthAge = 13;
const fakeOtpCode = '123456';
const otpResendCooldown = Duration(minutes: 5);

const _monthNames = [
  'january',
  'february',
  'march',
  'april',
  'may',
  'june',
  'july',
  'august',
  'september',
  'october',
  'november',
  'december',
];

final _nameCharacters = RegExp(r'^[\p{L}\p{M} ]+$', unicode: true);

String normalizeMyanmarPhoneNumber(String phoneNumber) {
  var value = phoneNumber.replaceAll(RegExp(r'[\s‐‑‒–—-]'), '');
  if (value.startsWith('+95')) value = value.substring(3);
  if (value.startsWith('0')) value = value.substring(1);
  return value;
}

bool isValidMyanmarPhoneNumber(String phoneNumber) =>
    RegExp(r'^9\d{7,9}$').hasMatch(normalizeMyanmarPhoneNumber(phoneNumber));

bool isValidFakeOtp(String otp) => otp == fakeOtpCode;

bool isValidFirstName(String value) {
  final name = value.trim();
  return name.isNotEmpty &&
      name.runes.length <= 50 &&
      _nameCharacters.hasMatch(name);
}

bool isValidLastName(String value) {
  final name = value.trim();
  return name.isEmpty ||
      (name.runes.length <= 50 && _nameCharacters.hasMatch(name));
}

int? parseBirthMonth(String value) {
  final month = value.trim().toLowerCase();
  if (month.isEmpty) return null;
  final number = int.tryParse(month);
  if (number != null) return number >= 1 && number <= 12 ? number : null;
  final index = _monthNames.indexWhere(
    (name) => name == month || name.substring(0, 3) == month,
  );
  return index < 0 ? null : index + 1;
}

DateTime? parseValidDateOfBirth({
  required String month,
  required String day,
  required String year,
  DateTime? today,
}) {
  final monthNumber = parseBirthMonth(month);
  final dayNumber = int.tryParse(day.trim());
  final yearText = year.trim();
  final yearNumber = int.tryParse(yearText);
  if (monthNumber == null ||
      dayNumber == null ||
      yearNumber == null ||
      yearText.length != 4 ||
      yearNumber < 1900) {
    return null;
  }

  final birthDate = DateTime(yearNumber, monthNumber, dayNumber);
  if (birthDate.year != yearNumber ||
      birthDate.month != monthNumber ||
      birthDate.day != dayNumber) {
    return null;
  }

  final referenceDate = today ?? DateTime.now();
  final referenceDay = DateTime(
    referenceDate.year,
    referenceDate.month,
    referenceDate.day,
  );
  if (birthDate.isAfter(referenceDay)) return null;

  var age = referenceDate.year - birthDate.year;
  final birthdayHasPassed =
      referenceDate.month > birthDate.month ||
      (referenceDate.month == birthDate.month &&
          referenceDate.day >= birthDate.day);
  if (!birthdayHasPassed) age--;
  return age >= minimumAuthAge ? birthDate : null;
}

bool isValidDateOfBirth({
  required String month,
  required String day,
  required String year,
  DateTime? today,
}) =>
    parseValidDateOfBirth(month: month, day: day, year: year, today: today) !=
    null;
