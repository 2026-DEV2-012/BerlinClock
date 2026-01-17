# BerlinClock

## Requirements
- Xcode 16+ (Swift Testing support) 
- iOS 15.6+ 

## Launch the app
1. Open `BerlinClock.xcodeproj`
2. Select a simulator with iOS 15.6 as minimum version
3. Launch the project `Cmd + R` or click the build and run button in Xcode

## Launch tests
`Cmd + U` in Xcode

Or in your terminal:
```bash
xcodebuild test -scheme BerlinClock -destination 'platform=iOS Simulator,name=<YOUR_SIMULATOR_NAME>'
```