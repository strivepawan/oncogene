import 'package:flutter/material.dart';

class DailyTask extends StatefulWidget {
  const DailyTask({Key? key}) : super(key: key);

  @override
  _DailyTaskState createState() => _DailyTaskState();
}

class TaskStyle {
  static const Color boxColor = Colors.blue;
  static const double borderRadiusValue = 10.0;
  static const TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class _DailyTaskState extends State<DailyTask> {
  List<Task> tasks = [
    Task('2-3 liter Water'),
    Task('Garlic'),
    Task('Green Tea'),
    Task('Nuts and Seeds'),
    Task('Custard apple'),
    Task('Yoga, Exercise and Stretching'),
    Task('Broocoli, Cauliflowers'),
    Task('Blue Barries, Strawnberries'),
    Task('Citrus fruits like Oranges'),

  ];

  List<Task> completedTasks = [];
  List<Task> pendingTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Tasks'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // List of tasks with checkboxes
              for (var task in tasks)
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF7370FF),
                    borderRadius: BorderRadius.circular(TaskStyle.borderRadiusValue),
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 8),
                  child: TaskListItem(
                    task: task,
                    onCheckboxChanged: (value) {
                      setState(() {
                        task.isCompleted = value!;
                      });
                    },
                  ),
                ),
              SizedBox(height: 16),
        
              // Submit button
              ElevatedButton(
                onPressed: () {
                  // Separate completed and pending tasks
                  completedTasks = tasks.where((task) => task.isCompleted).toList();
                  pendingTasks = tasks.where((task) => !task.isCompleted).toList();
        
                  // Show a dialog with completed and pending tasks
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Daily Track',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Completed Tasks:'),
                            for (var task in completedTasks) Text('- ${task.name}'),
                            SizedBox(height: 16),
                            Text('Pending Tasks:'),
                            for (var task in pendingTasks) Text('- ${task.name}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Center(child: Text('Submit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  final String name;
  bool isCompleted;

  Task(this.name, {this.isCompleted = false});
}

class TaskListItem extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onCheckboxChanged;

  TaskListItem({required this.task, required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: task.isCompleted,
          onChanged: onCheckboxChanged,
        ),
        Text(
          task.name,
          style: TaskStyle.textStyle,
        ),
      ],
    );
  }
}
