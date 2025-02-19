import 'package:flutter/material.dart';

class SelectRoomTile extends StatefulWidget {
  const SelectRoomTile(
      {super.key,
      required this.addFunc,
      required this.removeFunc,
      required this.count,
      required this.textStr});
  final VoidCallback addFunc;
  final VoidCallback removeFunc;
  final int count;
  final String textStr;

  @override
  State<SelectRoomTile> createState() => _SelectRoomTileState();
}

class _SelectRoomTileState extends State<SelectRoomTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: IconButton(onPressed: widget.addFunc, icon: Icon(Icons.add)),
        title: Text(
          "${widget.textStr} ${widget.count}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing:
            IconButton(onPressed: widget.removeFunc, icon: Icon(Icons.remove)),
      ),
    );
  }
}
