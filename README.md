# Circle Splash

A highly customizable Flutter package for creating beautiful animated circular splash screens with various corner animations.

## Preview

### Center Animation  
![Center Animation](https://github.com/zenithsyntax/circle_splash/raw/main/assets/center.gif)

### All Animation Types  
![All Animations](https://github.com/zenithsyntax/circle_splash/raw/main/assets/full.gif)

## Features

- ✨ Multiple animation types (center, corners)
- 🎨 Fully customizable colors and styling
- ⚡ Configurable animation duration and curves
- 🔧 Support for any widget as content (Image, Text, Icon, etc.)
- 📱 Responsive design that works on all screen sizes
- 🎯 Callback for animation completion

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  circle_splash: ^1.0.2

Then run:

```bash
flutter pub get
```

## Usage

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:circle_splash/circle_splash.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleSplashScreen(
      child: Image.asset(
        'assets/images/logo.png',
        width: 150,
        height: 150,
      ),
      onAnimationComplete: () {
        // Navigate to your main screen
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }
}
```

### Advanced Usage with Custom Configuration

```dart
CircleSplashScreen(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 80,
        color: Colors.white,
      ),
      SizedBox(height: 16),
      Text(
        'MyApp',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  ),
  config: CircleSplashConfig(
    animationType: CircleSplashAnimationType.topLeft,
    animationDuration: Duration(seconds: 3),
    circleColor: Colors.blue,
    backgroundColor: Colors.white,
    maxRadius: 1200,
    animationCurve: Curves.elasticOut,
    fadeStartInterval: 0.6,
    fadeEndInterval: 1.0,
  ),
  onAnimationComplete: () {
    // Your navigation logic here
  },
)
```

### Using with Text

```dart
CircleSplashScreen(
  child: Text(
    'Welcome',
    style: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  config: CircleSplashConfig(
    animationType: CircleSplashAnimationType.center,
    circleColor: Colors.deepPurple,
  ),
)
```

### Using with Custom Widget

```dart
CircleSplashScreen(
  child: Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterLogo(size: 60),
        SizedBox(height: 12),
        Text(
          'Flutter App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  ),
  config: CircleSplashConfig(
    animationType: CircleSplashAnimationType.bottomRight,
    circleColor: Colors.teal,
    backgroundColor: Colors.teal.shade50,
  ),
)
```


### CircleSplashConfig

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `animationType` | `CircleSplashAnimationType` | `center` | Type of circle animation |
| `animationDuration` | `Duration` | `Duration(seconds: 2)` | Duration of circle expansion |
| `fadeDuration` | `Duration` | `Duration(milliseconds: 500)` | Duration of content fade-in |
| `circleColor` | `Color` | `Colors.black` | Color of expanding circle |
| `backgroundColor` | `Color` | `Colors.white` | Background color |
| `maxRadius` | `double` | `1000` | Maximum circle radius |
| `animationCurve` | `Curve` | `Curves.easeInOut` | Circle animation curve |
| `fadeCurve` | `Curve` | `Curves.easeIn` | Fade animation curve |
| `fadeStartInterval` | `double` | `0.5` | When fade starts (0.0-1.0) |
| `fadeEndInterval` | `double` | `1.0` | When fade ends (0.0-1.0) |

### Animation Types

- `CircleSplashAnimationType.center` - Circle expands from center
- `CircleSplashAnimationType.topLeft` - Circle expands from top-left corner  
- `CircleSplashAnimationType.topRight` - Circle expands from top-right corner
- `CircleSplashAnimationType.bottomLeft` - Circle expands from bottom-left corner
- `CircleSplashAnimationType.bottomRight` - Circle expands from bottom-right corner

## Preview Videos

The package includes demo videos showing the animations in action:

- **Center Animation**: Shows the classic center expansion animation with smooth circular growth from the center of the screen
- **All Animations**: Demonstrates all five animation types in sequence - center, top-left, top-right, bottom-left, and bottom-right corner animations

These videos help you understand exactly what each animation type looks like before implementing them in your app.

## Example

Check out the [example](https://github.com/zenithsyntax/circle_splash/tree/main/example) directory for a complete sample app demonstrating all features.


## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/zenithsyntax/circle_splash/blob/main/LICENSE) file for details.

## Support

If you find this package helpful, please give it a ⭐ on [GitHub](https://github.com/zenithsyntax/circle_splash)!
