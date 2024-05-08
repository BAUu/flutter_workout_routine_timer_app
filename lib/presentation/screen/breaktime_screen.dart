import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workout_routine_timer_app/presentation/screen/main_screen.dart';
import 'start_workout_screen.dart';

class BreakTimeScreen extends StatefulWidget {
  final double breakTime;
  final Stopwatch stopwatch;

  const BreakTimeScreen(
      {super.key, required this.breakTime, required this.stopwatch});

  @override
  State<BreakTimeScreen> createState() => _BreakTimeScreenState();
}

class _BreakTimeScreenState extends State<BreakTimeScreen> {
  late double breakTimeInSeconds; // 휴식 시간(초 단위)
  late double remainingTime; // 남은 휴식 시간
  late Stopwatch stopwatch; // 스탑와치 인스턴스
  late Timer countdownTimer; // 타이머 인스턴스
  late double _breakTime;

  @override
  void initState() {
    super.initState();
    breakTimeInSeconds =
        widget.breakTime * 60; // StartWorkOutScreen 에서 전달받은 휴식 시간
    stopwatch = widget.stopwatch; // StartWorkOutScreen에서 전달받은 스탑와치 인스턴스
    remainingTime = breakTimeInSeconds; // 남은 휴식 시간 초기화
    _breakTime = widget.breakTime;

    countdownTimer = Timer.periodic(
        const Duration(seconds: 1), updateRemainingTime); // 1초마다 남은 시간 업데이트
  }

  String formattedRemainingTime() {
    final minutes = (remainingTime / 60).truncate();
    final seconds = (remainingTime % 60).truncate();
    return '$minutes:$seconds';
  }

  void updateRemainingTime(Timer timer) {
    setState(() {
      remainingTime = remainingTime - 1; // 남은 시간 업데이트
      if (remainingTime <= 0) {
        onCountdownFinished(); // 휴식 시간 종료 시 알림
        timer.cancel(); // 타이머 해제
      }
    });
  }

  void onCountdownFinished() {
    // 알림 기능 구현 (예: 소리 재생, 다이얼로그 표시 등)
    print('휴식 시간이 끝났습니다!');
    //Todo 끝났을때 무슨 기능을 넣어야할지 고민
  }

  @override
  void dispose() {
    countdownTimer.cancel(); // 화면 종료 시 타이머 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1E23),
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff959EA2),
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 340,
                height: 120,
                child: const Center(
                  child: Text(
                    'Workout Routine Timer',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'April16thTTF-Safety',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff959EA2),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 340,
              height: 240,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Break Time',
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'April16thTTF-Safety',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    formattedRemainingTime(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: 'April16thTTF-Safety',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            stopwatch.reset(); // 스탑와치 초기화
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Reset',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: const Color(0xff525E66),
              borderRadius: BorderRadius.circular(360 / 2),
              border: Border.all(color: Colors.black, width: 6),
            ),
            child: TextButton(
              onPressed: () {
                stopwatch.reset(); // 스탑와치 초기화
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartWorkOutScreen(
                      breakTime: _breakTime,
                      stopwatch: stopwatch,
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Restart',
                    style: TextStyle(
                      fontSize: 72,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'April16thTTF-Promise',
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
