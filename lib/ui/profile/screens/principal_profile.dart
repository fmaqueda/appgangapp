import 'package:appgangapp/ui/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class PrincipalProfile extends StatelessWidget {
  const PrincipalProfile({Key? key}) : super(key: key);

  String? _encodeQueryPars(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Uri _sendEmail() {
    return Uri(
      scheme: 'mailto',
      path: 'fmaqueda@gmail.com',
      query: _encodeQueryPars(<String, String>{
        'subject': 'Mi prueba de email!',
        'body': 'Lo que te quería decir'
      }),
    );
  }

  void _launchMail() async {
    if (!await launch(_sendEmail().toString())) {
      throw 'Could not launch $_sendEmail().toString()';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(5)),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(Icons.mail, size: 18),
            ),
            trailing: const Icon(Icons.arrow_right, size: 30),
            title: const Text("Email"),
            subtitle: const Text("Comparte por email"),
            onTap: () {
              _launchMail();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(5)),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(Icons.share, size: 18),
            ),
            trailing: const Icon(Icons.arrow_right, size: 30),
            title: const Text("Share"),
            subtitle: const Text("Comparte con tus amigos"),
            onTap: () {
              _onShare(context);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(5)),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(Icons.settings),
            ),
            trailing: const Icon(Icons.arrow_right, size: 30),
            title: const Text("Settings"),
            subtitle: const Text("Configura tu Perfil"),
            onTap: () {
              Get.to(ProfileScreen());
            },
          ),
        ],
      ),
    );
  }

  Future<void> _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(
      'check out my wesite https://example.com',
      subject: 'look what I made!',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}
