import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/views/medicine_detail_view.dart';
import 'package:pharma_track/widgets/medicine_buttom_sheet.dart';

class MedicineTile extends StatefulWidget {
  MedicineTile(
      {super.key,
      required this.name,
      required this.tName,
      required this.image,
      required this.companyName,
      required this.form,
      required this.expirationAt,
      required this.details,
      required this.createdAt,
      required this.updatedAt,
      this.price,
      this.quantity,
      this.id,
      this.favourite});
  final String name;
  final String tName;
  String? image;
  final String companyName;

  final String form;
  int? quantity;
  int? price;
  int? id;
  int? favourite;
  final String expirationAt;
  final String details;
  final String createdAt;
  final String updatedAt;

  @override
  State<MedicineTile> createState() => _MedicineTileState();
}

class _MedicineTileState extends State<MedicineTile> {
  bool? fav;

  @override
  Widget build(BuildContext context) {
    fav = widget.favourite == 0 ? false : true;
    print("${widget.favourite}ssssssssssss");
    print("${fav}kkkkkkkkkkkkkkkk");
    // AllApiCubit cubit = AllApiCubit.get(context);
    // cubit.allMedicine(context);
    // if (cubit.showFavouritrModel1?.data != null) {
    //   for (var favo in cubit.showFavouritrModel1!.data!) {
    //     if (favo.id == id) {
    //       fav = true;
    //     }
    //   }
    // }
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is ShowFavouriteSuccess1) {}
      },
      builder: (context, state) {
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MedicineDetaileView.id, arguments: {
                'name': widget.name,
                'tName': widget.tName,
                'image': widget.image,
                'companyName': widget.companyName,
                'form': widget.form,
                'quantity': widget.quantity,
                'price': widget.price,
                'expirationAt': widget.expirationAt,
                'details': widget.details,
                'createdAt': widget.createdAt,
                'updatedAt': widget.updatedAt,
                'id': widget.id,
                'favourite': widget.favourite,
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              "assets/images/images (8).png",
                              height: 120,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Text(
                                  widget.tName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  widget.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  "${widget.price} S.P",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      fav = !fav!;
                                      setState(() {});
                                      BlocProvider.of<AllApiCubit>(context)
                                          .addFavourit(context,
                                              fav: fav!, id: widget.id!);
                                      BlocProvider.of<AllApiCubit>(context)
                                          .allMedicine(
                                        context,
                                      );
                                    },
                                    child: Icon(
                                      !fav!
                                          ? Icons.favorite_outline
                                          : Icons.favorite,
                                      color: Colors.red,
                                      size: 28,
                                    )),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      context: context,
                                      builder: (context) {
                                        return MedicineButtomSheeet(
                                          name: widget.tName,
                                        );
                                      });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff31a9e3),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(64),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ));
      },
    );
  }
}
