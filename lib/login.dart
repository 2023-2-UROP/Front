import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    // 로그인 로직 구현

    // 사용자가 입력한 아이디와 비밀번호를 가져옴
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "admin" && password == "password") {
      // 아이디와 비밀번호가 올바를 경우, 로그인 성공
      Navigator.pop(context); // 로그인 성공 시 메인 화면으로 이동
    } else {
      // 아이디나 비밀번호가 올바르지 않을 경우, 오류 다이얼로그 표시
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("로그인 실패"),
            content: Text("아이디나 비밀번호가 올바르지 않습니다."),
            actions: [
              TextButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOGIN PAGE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[900], // 상단 내비게이션바 색상 설정
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // 여백 설정
        child: Column(
          children: [
            // 아이디 입력 필드
            TextField(
              controller: usernameController, // 컨트롤러 설정
              decoration: InputDecoration(
                labelText: 'INPUT ID', // 레이블 텍스트 설정
              ),
            ),

            // 비밀번호 입력 필드
            TextField(
              controller: passwordController, // 컨드롤러 설정
              obscureText: true, // 비밀번호 입력 시 입력 내용을 가려서 보이지 않게 함
              decoration: InputDecoration(
                labelText: 'INPUT PASSWORD', // 레이블 텍스트 설정
              ),
            ),
            SizedBox(height: 20), // 공간 여백 추가
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () => login(context), // 로그인 버튼 클릭시 로그인 함수 호출
                child: Text('LOGIN'), // 버튼 텍스트 설정
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // 버튼 색상 설정
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}