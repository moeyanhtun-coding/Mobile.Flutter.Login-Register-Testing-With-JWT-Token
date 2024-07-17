import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable Example'),
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Example item count
      itemBuilder: (context, index) {
        return Slidable(
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(index),

          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: StretchMotion(),

            // A pane can dismiss the Slidable.
            dismissible: DismissiblePane(onDismissed: () {}),
            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context) => _showSnackBar(""),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) => _showSnackBar(""),
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),

          // The end action pane is the one at the right or the bottom side.
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                onPressed: (context) => _showSnackBar(""),
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.archive,
                label: 'Archive',
              ),
              SlidableAction(
                onPressed: (context) => _showSnackBar(""),
                backgroundColor: Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.save,
                label: 'Save',
              ),
            ],
          ),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: const ListTile(title: Text('Slide me')),
        );
      },
    );
  }
}
