import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/portfolio/services/contact_services.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());
  ContactServices contactServices = ContactServicesImpl();

  Future<void> sendContactToEmail({
    required String name,
    required String email,
    required String message,
    required String subject,
    required String budget,
  }) async {
    emit(ContactLoading());
    try {
      await contactServices.sendContactToEmail(
        name: name,
        email: email,
        message: message,
        subject: subject,
        budget: budget,
      );
      emit(ContactSuccess(isSent: true, message: "Message sent successfully"));
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }

  Future<void> sendAutoReplyEmail({
    required String name,
    required String email,
    required String subject,
  }) async {
    emit(ContactLoading());
    try {
      await contactServices.sendAutoReplyEmail(
        name: name,
        email: email,
        subject: subject,
      );
      emit(
        ContactSuccess(
          isSent: true,
          message:
              "We have received your message and sent a reply to your email",
        ),
      );
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }

  Future<void> sendContactToTelegram({
    required String name,
    required String email,
    required String message,
    required String budget,
    required String subject,
  }) async {
    emit(ContactLoading());
    try {
      await contactServices.sendContactToTelegram(
        name: name,
        email: email,
        message: message,
        budget: budget,
        subject: subject,
      );
      emit(ContactSuccess(isSent: true));
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }
}
