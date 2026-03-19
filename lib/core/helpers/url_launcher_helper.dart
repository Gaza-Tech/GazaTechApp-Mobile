import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  UrlLauncherHelper._();

  /// Launch URL in external browser. Auto-prepends https:// if no scheme.
  static Future<bool> launchExternalUrl(String url) async {
    String sanitized = url.trim();
    if (!sanitized.startsWith('http://') && !sanitized.startsWith('https://')) {
      sanitized = 'https://$sanitized';
    }
    final uri = Uri.tryParse(sanitized);
    if (uri == null) return false;
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Open phone dialer. Strips formatting but preserves +.
  static Future<bool> launchPhoneDialer(String phoneNumber) async {
    final sanitized = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final uri = Uri(scheme: 'tel', path: sanitized);
    return launchUrl(uri);
  }

  /// Open WhatsApp chat via wa.me. Strips all non-digit chars.
  static Future<bool> launchWhatsApp(String whatsappNumber) async {
    final sanitized = whatsappNumber.replaceAll(RegExp(r'[^\d]'), '');
    final uri = Uri.parse('https://wa.me/$sanitized');
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
