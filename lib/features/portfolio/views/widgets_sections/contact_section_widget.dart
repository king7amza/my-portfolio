import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/portfolio/view_models/contact_cubit/contact_cubit.dart';
import 'package:portfolio/features/portfolio/views/widgets/contact_widget_mobile_view.dart';
import 'package:portfolio/features/portfolio/views/widgets/contact_widget_web_view.dart';

class ContactSectionWidget extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> contactKey;
  const ContactSectionWidget({super.key, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return size.width > 600
        ? BlocProvider(
            create: (context) => ContactCubit(),
            child: ContactWidgetWebView(contactKey: contactKey),
          )
        : BlocProvider(
            create: (context) => ContactCubit(),
            child: ContactWidgetMobileView(contactKey: contactKey),
          );
  }
}
