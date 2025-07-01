import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ekhtibar_app/app_brian.dart';
import 'package:flutter/services.dart';

AppBrian appBrian = AppBrian();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C++ Output Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0D47A1),
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2196F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            elevation: 6,
            shadowColor: Colors.black87,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const ExamPage(),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Icon> answerResult = [];
  int rightAnswer = 0;

  void checkAnswer(int userAnswer) {
    int correctAnswer = appBrian.questionGroup[appBrian.num].correctAnswerIndex;

    setState(() {
      if (userAnswer == correctAnswer) {
        rightAnswer++;
        answerResult.add(
          const Icon(Icons.check_circle, color: Colors.greenAccent, size: 28),
        );
      } else {
        answerResult.add(
          const Icon(Icons.cancel, color: Colors.redAccent, size: 28),
        );
      }

      if (appBrian.isFinshed()) {
        String resultTitle;
        Widget resultIcon;
        if (rightAnswer >= 8) {
          resultTitle = "Well done! You passed ✅";
          resultIcon = const Icon(
            Icons.check_circle,
            size: 80,
            color: Colors.greenAccent,
          );
        } else {
          resultTitle = "You did not pass ❌";
          resultIcon = const Icon(
            Icons.cancel,
            size: 80,
            color: Colors.redAccent,
          ); // 👈 بديل الصورة المفقودة
        }
        Alert(
          context: context,
          title: resultTitle,
          desc:
              "You answered $rightAnswer correctly out of ${appBrian.questionGroup.length} questions.",
          image: resultIcon, // 👈 هذا يعوّض عن type
          style: AlertStyle(
            backgroundColor: const Color(0xFF002B36),
            titleStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            descStyle: const TextStyle(color: Colors.white70, fontSize: 18),
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide.none,
            ),
            animationType: AnimationType.grow,
            isOverlayTapDismiss: false,
          ),
          buttons: [
            DialogButton(
              color: const Color(0xFF2196F3),
              onPressed: () {
                Navigator.pop(context);
                resetQuiz();
              },
              child: const Text(
                "Try Again",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ).show();
      } else {
        appBrian.nextQuestions();
      }
    });//blue svs;vs
    
  }

  //red
  //red
  void resetQuiz() {
    setState(() {
      appBrian.reset();
      answerResult.clear();
      rightAnswer = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = appBrian.questionGroup[appBrian.num];

    return Scaffold(
      appBar: AppBar(title: const Text('C++ Output Test')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF004D40), Color(0xFF0D47A1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (appBrian.num + 1) / appBrian.questionGroup.length,
              backgroundColor: Colors.white24,
              color: Colors.lightGreenAccent.shade400,
              minHeight: 10,
              semanticsLabel: 'Progress',
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 36,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: answerResult),
              ),
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: currentQuestion.questionImage,
            ),
            const SizedBox(height: 30),
            Text(
              currentQuestion.questionText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.choices.asMap().entries.map((entry) {
              int index = entry.key;
              String choice = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00796B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 8,
                    shadowColor: Colors.black54,
                  ),
                  child: Text(
                    choice,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
