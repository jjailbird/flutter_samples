# Flutter and Dart

## [Flutter의 null safety 이해하기](https://medium.com/flutter-korea/flutter%EC%9D%98-null-safety-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-dd4ee1f7d6a5)

- 순수 Dart: 모든 object 는 기본적으로 non-nullable
- Flutter Dart: nullable(?) 도입
- int 와 int?는 서로 다른 클래스! (int?; nullable int class; int의 super class)
- 변수의 초기화 없으면 컴파일 에러!

```dart
// null 조건 연산자 (nulll aware operator "?")
String? notString = null;
print(notString?.length); // null 출력

// null 보증 연산자 (null assertion operator "!")
String toString() {
  if (code == 200) return 'OK';
  return 'ERROR $code ${error!.toUpperCase()}';
}

// late operator는 non-nullable 이며 실제 instance 사용시 생성됨.
class Developer{
  String _techStack;
  void frontend() => _techStack = "flutter";
  void backend() => _techStack = "Spring";
  void devOps() => _techStack = "aws";
  String introduce() => "I'm using "+_techStack;
}

class Developer{
  late String _techStack;
  void frontend() => _techStack = "flutter";
  void backend() => _techStack = "Spring";
  void devOps() => _techStack = "aws";
  String introduce() => "I'm using "+_techStack;
}

// named parameter 
// null safety 적용 이전
void someFunc(int a,{int b}){} //가능
void someFunc(int a,{int b}){} //가능
// null safety 적용 이후
void someFunc(int? a,{required int b}){} //가능 
// void someFunc(int? a,{int b}){} 불가!

```

## Flutter Layout

### [Layouts in Flutter](https://docs.flutter.dev/development/ui/layout)

### [Row & Column Widgets](https://medium.com/flutter-korea/row-column-widgets-8c1ff09a6219)

- Row: 수평 / Column: 수직

- [Understand Basic Of Row and Column In Flutter](https://bishworajpoudelofficial.medium.com/understand-basic-of-row-and-column-in-flutter-9c037c8e339d)

### [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)

- Implements the basic material design visual layout structure.
- This class provides APIs for showing drawers, snack bars, and bottom sheets.

### [Container](https://api.flutter.dev/flutter/widgets/Container-class.html)

- A convenience widget that combines common painting, positioning, and sizing widgets.

- It basically contains different widget into one widget over which you can give padding , size , position etc.

## Icon / Splash screen

- [App Icon Generator](https://appicon.co/)

- [Online Image Editor](https://pixlr.com/kr/x/)

### Launcher icon

[플러터 앱 아이콘(icon) 변경하기](https://asufi.tistory.com/entry/Flutter-Flutter-%EC%95%B1-%EC%B6%9C%EC%8B%9C-%ED%95%98%EA%B8%B0-release-build-apk)

- Android: android/app/src/main/res

- IOS: ios/Runner/Assets.xcassets/AppIcon.appiconset

[1분만에 App Launcher Icon 설정하기 - with flutter_launcher_icons package](https://velog.io/@adbr/flutter-1%EB%B6%84%EB%A7%8C%EC%97%90-App-Launcher-Icon-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0)

### Splash Screen / Launch Screen

- [Official: Adding a splash screen to your mobile app](https://docs.flutter.dev/development/ui/advanced/splash-screen)

- [How to make a splash screen in Flutter](https://blog.logrocket.com/make-splash-screen-flutter/)

- [animated_splash_screen](https://pub.dev/packages/animated_splash_screen)

### Theme

- [Hoe to Create a Dynamic Theme in Flutter Using Provider](https://betterprogramming.pub/how-to-create-a-dynamic-theme-in-flutter-using-provider-e6ad1f023899)

## Design Pattern

### BLoC Pattern(Bussiness Logic Component Pattern)

[Getting Started with Flutter Bloc Pattern](https://www.mitrais.com/news-updates/getting-started-with-flutter-bloc-pattern/)

[Flutter Bloc on Event API](https://www.youtube.com/watch?v=f-ZtZMtMbs4)

[BLOC 패턴을 사용한 Flutter 프로젝트 아키텍쳐 설계](https://booiljung.github.io/technical_articles/flutter/state_management/architecture_your_flutter_project_using_bloc_pattern.html)

[Architect your Flutter project using BLOC pattern](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1)

## Tips

- 플러터 컴포넌트 가이드 보이기 설정 > Dart: Preview Flutter Ui Guides

- 위젯 배열 속성, 파라미터는 ","로 끝내고 자동 정렬 단축키 (vscode:[shift] + [alt] + [f])

- Vscode에서 코드 어시스턴트 기능 단축키 [crtl]+[.]

- [VS Code Extensions Every FLUTTER Developer Should Have](https://resocoder.com/2019/07/04/vs-code-extensions-every-flutter-developer-should-have/)

- [DevTools - (1) Flutter Inspector](https://mike123789-dev.tistory.com/entry/%ED%94%8C%EB%9F%AC%ED%84%B0-DevTools-1-Flutter-Inspector)

- [Flutter앱을 실제 iPhone에서 테스트하기 위해 필요한 설정](https://sy34.net/flutteraebeul-silje-iphoneeseo-teseuteuhagi-wihae-pilyohan-seoljeong/)

- Windows Tips

```cmd
# Windows 개발자 모드 설정
start ms-settings:developers

# Windows show dynamic port
netsh int ipv4 show dynamicport tcp

```

- Google map api 중 direction api 는 한국에서 동작하지 않음!!!

- [Google Maps Platform 사용 범위 세부정보](https://developers.google.com/maps/coverage?hl=ko)

- Mac ox App Store 업데이트 진행율 확인 방법: 응용프로그램>콘솔> "App Store"로 검색 시작 > Fraction Completed: 0.7570 -> 75% 진행

- "No Material widget found" 에러 대처 방법: Material 위젯 사용

```dart
Material(child: CloseButton())

```

### Android 패키지명 확인

```xml
android/app/src/main/AndroidManifest.xml

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="com.example.naver_map_test">
.
.
.
</manifest>
```

## [Flutter Command-Line tool](https://docs.flutter.dev/reference/flutter-cli)

### [터미널 기반 Flutter 개발환경](https://www.joinc.co.kr/w/man/12/flutter/terminal)

```bash
# Here’s how you might use the flutter tool to create, analyze, test, and run an app:
flutter create my_app
cd my_app
flutter analyze
flutter test
flutter run lib/main.dart

# Specify platforms
flutter create my_app --platforms=windows,macos,linux,web 

# To run pub commands using the flutter tool:
flutter pub get
flutter pub outdated
flutter pub upgrade

# Clean up related build, packages and etc.
flutter clean .

# Clean up dart processes
killall -9 dart # mac, linux
taskkill /F /IM dart.exe # windows

# List up emulators
flutter emulators

# Run emulator
flutter emulators --launch flutter_emulator_2


# Enable os desktop supports
flutter config --enable-windows-desktop # for the Windows runner
flutter config --enable-macos-desktop   # for the macOS runner
flutter config --enable-linux-desktop   # for the Linux runner

# Check current config
flutter config 

# Check supprted devices
flutter devices

# Run windows app 
flutter run -d windows


# Regenerate windows app
rm -rf windows
flutter create .


# Build 
flutter build windows
flutter build apk
flutter build web
```

## References

[Material Icons](https://fonts.google.com/icons?selected=Material+Icons)

[Cupertino Icons](https://pub.dev/packages/cupertino_icons)

[Flutter Cookbook](https://docs.flutter.dev/cookbook)

[불변성이란](https://evan-moon.github.io/2020/01/05/what-is-immutable/)

[Reading configuration files and settings in Flutter and Dart](https://suragch.medium.com/reading-configuration-files-and-settings-in-flutter-and-dart-cc14bbd93698)

[Dotenv](https://pub.dev/packages/flutter_dotenv)

[Project rename](https://pub.dev/packages/rename)

[Flutter Google Map With Live Location Tracking](https://www.youtube.com/watch?v=B9hsWOCXb_o)

[Kakao-map-flutter with webview](https://github.com/note11g/Kakao-Map-Flutter)

[Key란 무엇인가?](https://nsinc.tistory.com/214)

[scaffoldKey가 왜 필요한가? 어떨때 쓰이는가?](https://softwarefactory-thinker.tistory.com/66?category=946329)

[Dart extensions](https://diamantidis.github.io/2020/07/07/dart-extensions-flatten-flutter-nested-widget-trees)

[Material Design 3](https://m3.material.io/)

[Modal에 관한 간단한 고찰](https://velog.io/@dnr6054/Modal%EC%97%90-%EA%B4%80%ED%95%9C-%EA%B0%84%EB%8B%A8%ED%95%9C-%EA%B3%A0%EC%B0%B0)

[Flutter Desktop Application example](https://codelabs.developers.google.com/codelabs/flutter-github-client)

## With Native code

[Writing custom platform-specific code: flatform channels](https://docs.flutter.dev/development/platform-integration/platform-channels?tab=type-mappings-swift-tab)

[Integrating third-party native SDKs in Flutter]https://www.solutelabs.com/blog/integrating-third-party-native-sdks-in-flutter)

## Prevent Erros

### ERR_CLEARTEXT_NOT_PERMITTED

- androis/app/src/main/AndroidManifest.xml

```xml
<application
...
android:usesCleartextTraffic="true" />
```

### Enable networking

- androis/app/src/main/AndroidManifest.xml

```xml
<manifest xmlns:android... >
 ...
 <uses-permission android:name="android.permission.INTERNET" />
 <application .... />
</manifest>
```

- macos/Runner/DebugProfile.entitlements
- macos/Runner/Release.entitlements

```xml
<key>com.apple.security.network.server</key>
<true/>
<key>com.apple.security.network.client</key>
<true/>
```
