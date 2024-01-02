import 'package:flutter/material.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/report_card.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});
  static String id = 'ReportView';

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

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
        backgroundColor: Colors.transparent,
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
      body: (cubit.reportModel) == null
          ? Center(
              child: Text(
              "There is no order yet ",
              style: TextStyle(fontSize: 24),
            ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                  child: Text(
                    "report of this month",
                    style: TextStyle(color: Color(0xff31a9e3), fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Total amount",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "${cubit.reportModel!.data1![0].totalSales!}SYP",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff31a9e3),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.reportModel!.data!.length,
                    itemBuilder: (context, index) {
                      return ReportCard(
                        list: cubit.reportModel!.data![index],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
