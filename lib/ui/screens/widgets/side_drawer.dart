import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/store/save_user_data.dart';

import '../../../routes/route_name/route_names.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,required  this.userDetails,
  });

  final Map<String,dynamic> userDetails;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://us.123rf.com/450wm/azatvaleev/azatvaleev2110/azatvaleev211000001/175335301-mountains-range-morning-or-evening-landscape-with-fog-and-forest-sunrise-and-sunset-in-mountain.jpg?ver=6'))),
            accountName:  Text(
              "${userDetails['name']}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            accountEmail:  Text(
              '${userDetails['email']}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(userDetails['photoUrl']),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  CupertinoIcons.person_2,
                  color: Colors.black45,
                )),
            title: Text(
              "All Friends",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(RouteNames.FRIENDREQUESTSCREEN);
            },
            leading: const CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  CupertinoIcons.bell,
                  color: Colors.black45,
                )),
            title: const Text(
              "Friend Request",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            trailing: const SizedBox(
              width: 25,
              height: 25,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  '1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  CupertinoIcons.bell_circle,
                  color: Colors.black45,
                )),
            title: Text(
              "Notifications",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            trailing: SizedBox(
              width: 25,
              height: 25,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  '7',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black45,
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  CupertinoIcons.settings,
                  color: Colors.black45,
                )),
            title: Text(
              "Settings",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  CupertinoIcons.share,
                  color: Colors.black45,
                )),
            title: Text(
              "Share",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  CupertinoIcons.doc_plaintext,
                  color: Colors.black45,
                )),
            title: Text(
              "Report",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black45,
          ),
          ListTile(
            onTap: () {
              Future.delayed(const Duration(seconds: 2))
                  .then((value) => SaveUserData().logoutUser());
            },
            leading: const CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.logout,
                  color: Colors.black45,
                )),
            title: const Text(
              "Exit",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
