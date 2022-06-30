import 'package:flutter/material.dart';
import 'package:ok_upp/admin_item.dart';
import 'package:ok_upp/Adminlist.dart';
import 'package:ok_upp/admin_itm_widget.dart';

class AdminDashboard extends StatefulWidget {
  final String title = 'Lift Manager';
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.adminitemlist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_left,
          size: 50.0,
        ),
        onPressed: () {
          Navigator.pop(
            context,
          );
        }
      ),
      title: Text(widget.title),
      backgroundColor: Colors.black,
    ),
    body: Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: key,
            initialItemCount: items.length,
            itemBuilder: (context, index, animation) => buildItem(items[index], index, animation),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInsertButton0(),
              // buildInsertButton1(),
            ],
          ),
        ),
      ],
    ),
  );
  }

  Widget buildItem(item, int index, Animation<double> animation) => AdminItemWidget(
    item: item,
    animation: animation,
    onClicked: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'Yes',
            onPressed: () {
            removeItem(index);
            },
          ),
          content: const Text('Are You Sure Want to Delete Item?'),
          duration: const Duration(milliseconds: 1500),
          width: double.infinity, 
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0, 
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    }
  );

  //ignore: deprecated_member_use
  Widget buildInsertButton0() => RaisedButton(
    child: const Text(
      'Insert item',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
    color: Colors.black,
    onPressed: () => insertIterm(0, Data.adminitemlist[0]),
  );

  // ignore: deprecated_member_use
  // Widget buildInsertButton1() => RaisedButton(
  //   child: Text(
  //     'Insert item',
  //     style: TextStyle(fontSize: 20, color: Colors.black),
  //   ),
  //   color: Colors.black,
  //   onPressed: () => insertIterm(0, Data.adminitemlist[1]),
  // );

  void insertIterm(int index, AdminliftItem item) {
    items.insert(index, item);
    key.currentState!.insertItem(index);
  }

  void removeItem(int index) {
    final item = items.removeAt(index);
    key.currentState!.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),      
    );
  }
}