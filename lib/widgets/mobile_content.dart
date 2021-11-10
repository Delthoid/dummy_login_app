import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/providers/profile_provider.dart';
import 'package:dummy_login_app/screens/home.dart';
import 'package:dummy_login_app/widgets/button.dart';
import 'package:dummy_login_app/widgets/friends_list.dart';
import 'package:dummy_login_app/widgets/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MobileContent extends StatefulWidget {
  const MobileContent({Key? key}) : super(key: key);

  @override
  State<MobileContent> createState() => _MobileContentState();
}

class _MobileContentState extends State<MobileContent> {
  late ProfileProvider accounts;
  late AppProvider appProvider;

  Future<void> getUsers(BuildContext context, String email) async {
    accounts.getUsers(email);
  }

  @override
  void initState() {
    accounts = Provider.of<ProfileProvider>(context, listen: false);
    appProvider = Provider.of<AppProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUsers(context, appProvider.currentEmail);
    //fecthuserInfo(context, appProvider.currentEmail);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<ProfileProvider>(
            builder: (context, profile, child) {
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/avatar.png',
                        width: 45,
                      ),
                      const Divider(
                        height: 20,
                        color: Colors.transparent,
                      ),
                      const Text('Hello'),
                      Text(
                        profile.userInfo.firstName,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                  const Expanded(child: Center())
                ],
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.transparent,
              ),
              const Text('Some random person from API'),
              const FriendsList(),
              const Text('Lonely Content Here'),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/pana.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              CustomButton(
                child: appProvider.runningOnWeb
                    ? const Text('Click for surprise')
                    : const Text('Tap for surprise'),
                action: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        content: const VideoPlayerScreen(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
