import 'package:flutter/material.dart';
import "package:ok_upp/admin_item.dart";

class AdminItemWidget extends StatefulWidget {
  final AdminliftItem item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  // ignore: use_key_in_widget_constructors
  const AdminItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
  });

  @override
  State<AdminItemWidget> createState() => _AdminItemWidgetState();
}

class _AdminItemWidgetState extends State<AdminItemWidget> {
  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: widget.animation,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: Colors.purple,
              border: Border.all(
                //HexColor('#301934'),
                color: widget.item.colorBorder,
                width: 3,
              )),
          child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(widget.item.image),
              ),
              title: Row(
                children: [
                  Text(
                    'Target Floor: 3',
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 20,
                        color: Colors.yellow[600]),
                  ),
                  Container(
                    width: 25,
                  ),
                  Text(
                    widget.item.time,
                    style: const TextStyle(
                        fontFamily: "Cairo", color: Colors.white),
                  ),
                ],
              ),
              subtitle: Column(
                children: const <Widget>[
                  Text(
                    'Someone has requested to activated the emergency lift \n',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Recommended lift: A',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              // const Text(
              //   'Someone has requested to activated the emergency',
              //   style: TextStyle(
              //     fontSize: 15,
              //     color: Colors.white,
              //   ),
              // ),
              trailing: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            action: SnackBarAction(
                              label: 'Yes',
                              onPressed: () {
                              null;
                              },
                            ),
                            content: const Text('Are You Sure Want to Activate the emergency lift ?'),
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
                      },
                      icon: const Icon(
                        Icons.check_box,
                        color: Colors.green,
                      ),
                    ),
                    // IconButton(
                    //   onPressed: widget.onClicked,
                    //   icon: const Icon(
                    //     Icons.cancel_presentation_rounded,
                    //     color: Colors.red,
                    //   ),
                    // ),
                  ],
                ),
              )),
        ),
      );
}
