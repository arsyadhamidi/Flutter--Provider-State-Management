import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/module/add_kampus/add_kampus_controller/addkampuscontroller.dart';

class AddKampusPage extends StatelessWidget {
  const AddKampusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddKampusController(),
      child: Consumer<AddKampusController>(
        builder: (context, addkampusController, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text("Add Kampus"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: addkampusController.isNamaKampusCont,
                    decoration: InputDecoration(
                        hintText: "Campus Name",
                        prefixIcon: Icon(CupertinoIcons.person_2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide()
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: addkampusController.isNamaJurusanCont,
                    decoration: InputDecoration(
                        hintText: "Major Name",
                        prefixIcon: Icon(CupertinoIcons.person_2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide()
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: addkampusController.isNamaProdiCont,
                    decoration: InputDecoration(
                        hintText: "Study Program",
                        prefixIcon: Icon(CupertinoIcons.person_2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide()
                        )
                    ),
                  ),
                  Spacer(),
                  MaterialButton(
                    onPressed: (){
                      addkampusController.addDataKampus(context);
                    },
                    height: 40,
                    minWidth: double.infinity,
                    color: Colors.green,
                    child: Text("Save", style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
