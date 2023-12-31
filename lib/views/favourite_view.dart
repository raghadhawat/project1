import 'package:flutter/material.dart';
import 'package:pharma_track/widgets/favourite_list.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});
  static String id = 'FavouriteView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
                size: 32,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_none_rounded,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ],
        ),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: EdgeInsets.only(top: 12),
              child: FavouriteList(),
            )));
  }
}
