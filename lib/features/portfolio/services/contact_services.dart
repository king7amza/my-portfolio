import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/core/app_constents.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ContactServices {
  Future<bool> sendContactToEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String budget,
  });

  Future<bool> sendContactToTelegram({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String budget,
  });

  Future<bool> sendAutoReplyEmail({
    required String name,
    required String email,
    required String subject,
  });

  Future<void> openWhatsApp({
    required String phoneNumber,
    required String message,
  });
}

class ContactServicesImpl implements ContactServices {
  @override
  Future<bool> sendContactToEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String budget,
  }) async {
    final url = Uri.parse(
      AppConstents.emailJsBaseUrl + AppConstents.emailJsEndpoint,
    );
    final String serviceId = dotenv.env['SERVICE_ID'] ?? '';
    final String templateId = dotenv.env['CONTACT_US_TEMPLATE_ID'] ?? '';
    final String userId = dotenv.env['PUBLIC_KEY'] ?? '';
    final String accessToken = dotenv.env['PRIVATE_KEY'] ?? '';
    try {
      final response = await http
          .post(
            url,
            body: jsonEncode({
              "service_id": serviceId,
              "template_id": templateId,
              "user_id": userId,
              "accessToken": accessToken,
              "template_params": {
                "name": name,
                "email": email,
                "message": message,
              },
            }),
            headers: {"Content-Type": "application/json"},
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return true;
      }
      throw Exception('Failed to send contact to email');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendAutoReplyEmail({
    required String name,
    required String email,
    required String subject,
  }) async {
    try {
      final String serviceId = dotenv.env['SERVICE_ID'] ?? '';
      final String templateId = dotenv.env['AUTO_REPLY_TEMPLATE_ID'] ?? '';
      final String userId = dotenv.env['PUBLIC_KEY'] ?? '';
      final String accessToken = dotenv.env['PRIVATE_KEY'] ?? '';
      final url = Uri.parse(
        AppConstents.emailJsBaseUrl + AppConstents.emailJsEndpoint,
      );
      final response = await http
          .post(
            url,
            body: jsonEncode({
              "service_id": serviceId,
              "template_id": templateId,
              "user_id": userId,
              "accessToken": accessToken,
              "template_params": {
                "name": name,
                "title": subject,
                "from_email": email,
              },
            }),
            headers: {"Content-Type": "application/json"},
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to send auto-reply email');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendContactToTelegram({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String budget,
  }) async {
    try {
      final String botToken = dotenv.env['TELEGRAM_BOT_TOKEN'] ?? '';
      final String chatId = dotenv.env['TELEGRAM_CHAT_ID'] ?? '';
      final String fullTelegramUrl =
          AppConstents.telegramBaseUrl +
          AppConstents.telegramEndpoint(
            token: botToken,
            methodName: 'sendMessage',
          );
      final url = Uri.parse(fullTelegramUrl);
      final response = await http.post(
        url,
        body: jsonEncode({
          'chat_id': chatId,
          'text':
              'Name: $name\nEmail: $email\nBudget: $budget\nSubject: $subject\nMessage: $message',
          'parse_mode': 'Markdown',
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        return true;
      }
      throw Exception('Failed to send contact to Telegram: ${response.body}');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> openWhatsApp({
    required String phoneNumber,
    required String message,
  }) async {
    try {
      final Uri whatsappUri = Uri.parse(
        AppConstents.whatsAppBaseUrl +
            AppConstents.whatsAppEndpoint(
              phoneNumber: phoneNumber,
              message: message,
            ),
      );
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch $whatsappUri');
      }
    } catch (e) {
      rethrow;
    }
  }
}
