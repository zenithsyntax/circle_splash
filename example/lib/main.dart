import 'package:flutter/material.dart';
import 'package:circle_splash/circle_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Splash Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/demo': (context) => DemoScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleSplashScreen(
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.flutter_dash,
            size: 80,
            color: Colors.white,
          ),
          SizedBox(height: 16),
          Text(
            'Circle Splash',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Example App',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      config: const CircleSplashConfig(
        animationType: CircleSplashAnimationType.center,
        animationDuration: Duration(seconds: 2),
        circleColor: Colors.deepPurple,
        backgroundColor: Colors.white,
        maxRadius: 1000,
        fadeStartInterval: 0.6,
      ),
      onAnimationComplete: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Splash Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Circle Splash!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/demo');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('View More Examples'),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoScreen extends StatelessWidget {
  final List<DemoConfig> demos = [
    DemoConfig(
      title: 'Center Animation',
      subtitle: 'Classic center expansion',
      animationType: CircleSplashAnimationType.center,
      circleColor: Colors.blue,
    ),
    DemoConfig(
      title: 'Top Left Corner',
      subtitle: 'Expands from top-left',
      animationType: CircleSplashAnimationType.topLeft,
      circleColor: Colors.green,
    ),
    DemoConfig(
      title: 'Top Right Corner',
      subtitle: 'Expands from top-right',
      animationType: CircleSplashAnimationType.topRight,
      circleColor: Colors.orange,
    ),
    DemoConfig(
      title: 'Bottom Left Corner',
      subtitle: 'Expands from bottom-left',
      animationType: CircleSplashAnimationType.bottomLeft,
      circleColor: Colors.red,
    ),
    DemoConfig(
      title: 'Bottom Right Corner',
      subtitle: 'Expands from bottom-right',
      animationType: CircleSplashAnimationType.bottomRight,
      circleColor: Colors.purple,
    ),
  ];

   DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Examples'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final demo = demos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: demo.circleColor,
                child: const Icon(Icons.play_arrow, color: Colors.white),
              ),
              title: Text(demo.title),
              subtitle: Text(demo.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DemoSplashScreen(config: demo),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DemoSplashScreen extends StatelessWidget {
  final DemoConfig config;

  const DemoSplashScreen({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return CircleSplashScreen(
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 60,
              color: config.circleColor,
            ),
            SizedBox(height: 16),
            Text(
              config.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              config.subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      config: CircleSplashConfig(
        animationType: config.animationType,
        animationDuration: const Duration(milliseconds: 3000),
        circleColor: config.circleColor,
        backgroundColor: Colors.grey.shade50,
        fadeStartInterval: 0.6,
        animationCurve: Curves.easeInOut,
      ),
      onAnimationComplete: () {
        Navigator.pop(context);
      },
    );
  }
}

class DemoConfig {
  final String title;
  final String subtitle;
  final CircleSplashAnimationType animationType;
  final Color circleColor;

  DemoConfig({
    required this.title,
    required this.subtitle,
    required this.animationType,
    required this.circleColor,
  });
}
