import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'list.dart';

class todolistmake extends StatefulWidget {
  const todolistmake({super.key});


  @override
  State<todolistmake> createState() => _todolistmakeState();
}

class _todolistmakeState extends State<todolistmake> {

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  DateTime initialDay = DateTime.now();
  DateTime initialtime = DateTime.now();
  DateTime time1 = DateTime(2023, 1, 1, 0, 0);
  DateTime time2 = DateTime(2016, 1, 1, 23, 59);
  TextEditingController A = TextEditingController();
  final box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 233, 193),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 233, 193),
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("취소",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () {
            if ((A.text)=='')
            {
              showDialog(
                context: context,
                builder: (context)=>AlertDialog(
                  actions: [
                    TextButton(onPressed: () =>
                        Navigator.pop(context),
                      child: Text("OK"),
                    ),
                  ],
                  title: Text("Error"),
                  content: Text("할일을 작성해주세요."),
                ),
              );
            }
            else
            {
              Navigator.pop(context);
            }
          },
            child: Text("완료",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "오늘의 할일이 무엇인가요?",
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: A,
                cursorColor: Colors.indigo,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: "할 일",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("날짜",
                    style: TextStyle(fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    '${initialDay.year} - ${initialDay.month} - ${initialDay
                        .day}',
                    style: TextStyle(fontSize: 25,
                      color: Colors.indigo,),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: initialDay,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000));
                      if (dateTime != null) {
                        setState(() {
                          initialDay = dateTime;
                        });
                      }
                    },
                    child: Text('날짜 선택',
                      style: TextStyle(fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child:
                Row(
                  children:
                  [
                    SizedBox(
                      width: 72,
                    ),
                    Text("Start time",
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    SizedBox(
                      width: 95,
                    ),
                    Text("End time",style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("시간",
                    style: TextStyle(fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    child:  CupertinoButton(
                      onPressed: () => _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: time1,
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (DateTime newTime) {
                            setState(() => time1 = newTime);
                          },
                        ),
                      ),
                      child: Text(
                        '${time1.hour}:${time1.minute}',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 93,
                  ),
                  SizedBox(
                    child: CupertinoButton(
                      onPressed: () => _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: time2,
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (DateTime newTime) {
                            setState(() => time2 = newTime);
                          },
                        ),
                      ),
                      child: Text(
                        '${time2.hour}:${time2.minute}',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("메모",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 200.0,),
                  border: OutlineInputBorder(),
                  hintText: "내용을 입력하세요!",
                ),
              ),
            ],
             //Task task = Task(
          //title: A.text.toString(),
         //   isCompleted: 0,
         //   date: initialDay,
        //    startTime: time1,
       //     endTime: time2,
        ),
          ),
        ),
      );
   // ),
  }
}