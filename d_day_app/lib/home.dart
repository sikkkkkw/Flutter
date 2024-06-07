import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  final void Function(bool) changeTheme;

  const Home({
    super.key,
    required this.changeTheme,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;
  bool isEditing = false;
  var title = '수능';
  DateTime setDate = DateTime.now();
  // 시간을 뺀 현재 날짜
  DateTime onlyDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int timeDiff = onlyDate.difference(setDate).inDays;

    return Scaffold(
      appBar: AppBar(
        title: Text("D-Day"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDark = !isDark;
              });
              widget.changeTheme(isDark);
            },
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            icon: Icon(isDark ? Icons.check : Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isEditing) Text(title),
            if (isEditing)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: "제목을 입력해주세요."),
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "${timeDiff > 0 ? timeDiff.toString().padLeft(timeDiff.toString().length + 1, '+') : timeDiff}",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
                Text("일째"),
              ],
            ),
            TextButton(
              onPressed: () async {
                // optional date
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2024, 1, 1),
                    lastDate: DateTime(2024, 12, 31));
                print(date);
                setState(() {
                  // null일때 setDate를 넣겠다.
                  setDate = date ?? setDate;
                });
              },
              child: Text("${DateFormat('yyyy-MM-dd').format(setDate)}"),
            )
          ],
        ),
      ),
    );
  }
}
