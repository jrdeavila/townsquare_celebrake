/// Represents an application-specific exception with a severity level.
///
/// This class extends [Equatable] to provide value equality for its properties.
///
/// The [AppException] class includes a message, an optional code, an optional title,
/// and a severity level represented by the [AppExceptionSeverity] enum.
///
/// The severity level can be one of the following:
/// - [AppExceptionSeverity.error]
/// - [AppExceptionSeverity.warning]
/// - [AppExceptionSeverity.info]
/// - [AppExceptionSeverity.success]
///
/// Constructors:
/// - [AppException.error]: Creates an error exception.
/// - [AppException.warning]: Creates a warning exception.
/// - [AppException.info]: Creates an info exception.
/// - [AppException.success]: Creates a success exception.
///
/// Properties:
/// - [message]: The message describing the exception.
/// - [code]: An optional code representing the exception.
/// - [title]: An optional title for the exception.
/// - [severity]: The severity level of the exception.
///
/// Example usage:
/// ```dart
/// try {
///   // Some code that might throw an exception
/// } catch (e) {
///   throw AppException.error(message: 'An error occurred', code: 'ERROR_CODE');
/// }
/// ```
library;

import 'package:equatable/equatable.dart';

enum AppExceptionSeverity { error, warning, info, success }

class AppException extends Equatable {
  final String message;
  final String? code;
  final String? title;
  final AppExceptionSeverity severity;

  const AppException({
    required this.message,
    this.code,
    this.title,
    this.severity = AppExceptionSeverity.error,
  });

  factory AppException.error({
    required String message,
    String? code,
    String? title,
  }) {
    return AppException(
      message: message,
      code: code,
      title: title,
      severity: AppExceptionSeverity.error,
    );
  }

  factory AppException.warning({
    required String message,
    String? code,
    String? title,
  }) {
    return AppException(
      message: message,
      code: code,
      title: title,
      severity: AppExceptionSeverity.warning,
    );
  }

  factory AppException.info({
    required String message,
    String? code,
    String? title,
  }) {
    return AppException(
      message: message,
      code: code,
      title: title,
      severity: AppExceptionSeverity.info,
    );
  }

  factory AppException.success({
    required String message,
    String? code,
    String? title,
  }) {
    return AppException(
      message: message,
      code: code,
      title: title,
      severity: AppExceptionSeverity.success,
    );
  }

  factory AppException.unknown() {
    return const AppException(
      message: 'An unknown error occurred',
      code: 'UNKNOWN_ERROR',
      title: 'Unknown Error',
      severity: AppExceptionSeverity.error,
    );
  }

  @override
  List<Object?> get props => [message, code, title, severity];
}
