import 'package:dummy_login_app/models/user_list_model.dart';
import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/providers/profile_provider.dart';
import 'package:dummy_login_app/screens/home.dart';
import 'package:dummy_login_app/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    // List<Datum> _friends;
    return SingleChildScrollView(
      child: Consumer<ProfileProvider>(
        builder: (context, profile, child) {
          List<Widget> _users = [];
          return SizedBox(
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: profile.dataList.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return UserCard(
                  data: profile.dataList.elementAt(index),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
