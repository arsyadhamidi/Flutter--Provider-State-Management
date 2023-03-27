import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/global/data_global.dart';
import 'package:task3/model/modeluser.dart';
import 'package:task3/module/add_kampus/view/add_kampus_page.dart';
import 'package:task3/module/dashboard/dashboard_controller/dashboardcontroller.dart';
import 'package:task3/module/splashscreen/view/splashscreen_page.dart';
import 'package:task3/module/update_kampus/view/update_kampus_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardController(context),
      child: Consumer<DashboardController>(
        builder: (context, dashboardController, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text(
                dataGlobal.user?.data?.nama ?? '',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplasScreenPage()),
                              (route) => false);
                    },
                    icon: Icon(Icons.logout)),
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<DashboardController>(
                  builder: (context, dashboardController, child) {
                    return dashboardController.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                      itemCount: dashboardController.listkampus?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListTile(
                              onTap: () async{
                                await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateKampusPage(
                                  data: dashboardController.listkampus?[index],
                                ))
                                );
                                if(mounted){
                                  setState(() {
                                    dashboardController.listDataKampus(context);
                                  });
                                }
                              },
                              title: Text(dashboardController
                                  .listkampus?[index].namaKampus ??
                                  ''),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(dashboardController
                                      .listkampus?[index].namaJurusan ??
                                      ''),
                                  Text(dashboardController
                                      .listkampus?[index].namaProdi ??
                                      ''),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    dashboardController.deleteDataKampus(
                                        context,
                                        dashboardController.listkampus?[index].idKampus.toString() ?? ''
                                    );
                                    dashboardController.listDataKampus(context);
                                  },
                                  icon: Icon(CupertinoIcons.trash)),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddKampusPage()));
                if(mounted){
                  dashboardController.listDataKampus(context);
                }
              },
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
