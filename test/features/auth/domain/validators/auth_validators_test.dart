import 'package:donut_test/features/auth/domain/validators/auth_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Myanmar phone validation', () {
    test('normalizes the registration example to the local number', () {
      expect(normalizeMyanmarPhoneNumber('09254135592'), '9254135592');
      expect(
        '+95${normalizeMyanmarPhoneNumber('09254135592')}',
        '+959254135592',
      );
    });

    test('strips spaces and dashes and removes only one leading zero', () {
      expect(normalizeMyanmarPhoneNumber('+95 09-2541-35592'), '9254135592');
      expect(normalizeMyanmarPhoneNumber('009254135592'), '09254135592');
    });

    test('requires 9 followed by seven to nine digits', () {
      expect(isValidMyanmarPhoneNumber('91234567'), isTrue);
      expect(isValidMyanmarPhoneNumber('9123456789'), isTrue);
      expect(isValidMyanmarPhoneNumber('9123456'), isFalse);
      expect(isValidMyanmarPhoneNumber('91234567890'), isFalse);
      expect(isValidMyanmarPhoneNumber('812345678'), isFalse);
      expect(isValidMyanmarPhoneNumber('+95 09 2541 35592'), isTrue);
    });
  });

  group('fake OTP validation', () {
    test('accepts only the six-digit fake code', () {
      expect(isValidFakeOtp('123456'), isTrue);
      expect(isValidFakeOtp('123457'), isFalse);
      expect(isValidFakeOtp('12345'), isFalse);
      expect(isValidFakeOtp('1234567'), isFalse);
      expect(isValidFakeOtp('12a456'), isFalse);
    });

    test('resend cooldown is five minutes', () {
      expect(otpResendCooldown, const Duration(minutes: 5));
    });
  });

  group('first name validation', () {
    test('requires one to fifty trimmed letters and spaces', () {
      expect(isValidFirstName('  May Aung  '), isTrue);
      expect(isValidFirstName('a' * 50), isTrue);
      expect(isValidFirstName('a' * 51), isFalse);
      expect(isValidFirstName('   '), isFalse);
    });

    test('accepts Myanmar script and rejects digits or punctuation', () {
      expect(isValidFirstName('မောင် အောင်'), isTrue);
      expect(isValidFirstName('Aung2'), isFalse);
      expect(isValidFirstName("Aung-Oo"), isFalse);
    });
  });

  group('last name validation', () {
    test('allows an empty trimmed value', () {
      expect(isValidLastName(''), isTrue);
      expect(isValidLastName('   '), isTrue);
    });

    test('applies the same fifty-character letter rules when present', () {
      expect(isValidLastName('  Win  '), isTrue);
      expect(isValidLastName('က' * 50), isTrue);
      expect(isValidLastName('က' * 51), isFalse);
      expect(isValidLastName('Win3'), isFalse);
    });
  });

  group('date of birth validation', () {
    final today = DateTime(2026, 11, 10);

    test('accepts real dates and leap day only in leap years', () {
      expect(
        isValidDateOfBirth(
          month: 'February',
          day: '29',
          year: '2000',
          today: today,
        ),
        isTrue,
      );
      expect(
        isValidDateOfBirth(month: 'Feb', day: '29', year: '1900', today: today),
        isFalse,
      );
      expect(
        isValidDateOfBirth(
          month: 'April',
          day: '31',
          year: '2000',
          today: today,
        ),
        isFalse,
      );
    });

    test('rejects future dates and requires age thirteen', () {
      expect(
        isValidDateOfBirth(
          month: 'November',
          day: '10',
          year: '2013',
          today: today,
        ),
        isTrue,
      );
      expect(
        isValidDateOfBirth(
          month: 'November',
          day: '11',
          year: '2013',
          today: today,
        ),
        isFalse,
      );
      expect(
        isValidDateOfBirth(
          month: 'November',
          day: '11',
          year: '2026',
          today: today,
        ),
        isFalse,
      );
      expect(
        isValidDateOfBirth(month: '13', day: '10', year: '2000', today: today),
        isFalse,
      );
    });
  });
}
