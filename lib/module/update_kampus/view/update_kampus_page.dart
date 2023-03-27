import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/model/listmodelkampus.dart';
import 'package:task3/module/update_kampus/update_kampus_controller/updatekampuscontroller.dart';

class UpdateKampusPage extends StatelessWidget {
  final ListModelKampus? data;

  UpdateKampusPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UpdateKampusController(
            data?.namaKampus ?? '',
            data?.namaJurusan ?? '',
            data?.namaProdi ?? ''),
        child: Consumer<UpdateKampusController>(
          builder: (context, dashboardController, child) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Text("Update Campus"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      controller: dashboardController.isNamaKampusCont,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: "Campus Name",
                          prefixIcon: Icon(CupertinoIcons.person_2)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: dashboardController.isNamaJurusanCont,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: "Major Name",
                          prefixIcon: Icon(CupertinoIcons.person_2)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: dashboardController.isNamaProdiCont,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: "Study Program Name",
                          prefixIcon: Icon(CupertinoIcons.person_2)),
                    ),
                    Spacer(),
                    MaterialButton(
                        onPressed: () {
                          dashboardController.updateDataKampus(
                              context,
                              data?.idKampus.toString() ?? '');
                        },
                        height: 50,
                        minWidth: double.infinity,
                        color: Colors.green,
                        child: Text("Save Change",
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
