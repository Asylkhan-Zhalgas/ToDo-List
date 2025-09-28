import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      title: Center(
        child: Text(
          'Удалить задачу?',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),

      actions: [
        Center(
          child: Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),

                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  'Нет',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  backgroundColor: Colors.blueGrey,
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('Да', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
