import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/category_list.dart';
import 'package:pharma_track/widgets/all_medicine_list.dart';
import 'package:pharma_track/widgets/search_all_medicine.dart';
import 'package:pharma_track/widgets/search_category.dart';

class AllMedicineView extends StatefulWidget {
  const AllMedicineView({super.key});
  static String id = 'AllMedicineView';

  @override
  State<AllMedicineView> createState() => _AllMedicineViewState();
}

class _AllMedicineViewState extends State<AllMedicineView> {
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
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.grey,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text(
                        'Category',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                      onTap: () {
                        showSearch(
                            context: context, delegate: SearchCategory());
                      },
                    ),
                    PopupMenuItem(
                      child: const Text(
                        'Medicine',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                      onTap: () {
                        showSearch(
                            context: context, delegate: SearchAllMedicine());
                      },
                    )
                  ]),
          const Padding(
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
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryList()),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(child: AllMedicineList()),
          ],
        ),
      ),
    );
  }
}
