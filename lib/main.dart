import 'package:flutter/material.dart';
import 'package:todo_list/widgets/delete_dialog.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _editingTextController = TextEditingController();
  List<String> _tasks = [];

  int? _editingIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: _editingIndex == index
                            ? TextField(
                                controller: _editingTextController,
                                onSubmitted: (value) {
                                  setState(() {
                                    _tasks[index] = value;
                                    _editingIndex = null;
                                  });
                                },
                              )
                            : Text(_tasks[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (context) {
                                    return DeleteDialog();
                                  },
                                );
                                if (confirm == true)
                                  setState(() {
                                    _tasks.removeAt(index);
                                  });
                              },

                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    _editingIndex = index;
                                    _editingTextController.text = _tasks[index];
                                  });
                                });
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Введите задачу...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),

                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (_controller.text.isEmpty) return;
                      setState(() {
                        _tasks.add(_controller.text);
                        _controller.clear();
                      });
                    },
                    icon: Icon(Icons.send),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
