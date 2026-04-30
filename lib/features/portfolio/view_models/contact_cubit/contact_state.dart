part of 'contact_cubit.dart';

sealed class ContactState {}

final class ContactInitial extends ContactState {}

final class ContactLoading extends ContactState {}

final class ContactSuccess extends ContactState {
  final bool isSent;
  final String? message;
  ContactSuccess({required this.isSent, this.message});
}

final class ContactError extends ContactState {
  final String errorMessage;
  ContactError(this.errorMessage);
}
