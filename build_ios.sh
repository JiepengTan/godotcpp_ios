#!/bin/sh
TARGET="template_debug"
if [ "$1" ]; then
    TARGET="$1"
fi
echo "Target: $TARGET"
scons 
scons arch=universal ios_simulator=yes platform=ios target=$TARGET
scons arch=arm64 ios_simulator=no platform=ios target=$TARGET

xcodebuild -create-xcframework -library ./game/bin/libgdexample.ios.$TARGET.a -library ./game/bin/libgdexample.ios.$TARGET.simulator.a -output ./game/bin/libgdexample.ios.$TARGET.xcframework
xcodebuild -create-xcframework -library ./godot-cpp/bin/libgodot-cpp.ios.$TARGET.arm64.a -library ./godot-cpp/bin/libgodot-cpp.ios.$TARGET.universal.simulator.a  -output ./game/bin/libgodot-cpp.ios.$TARGET.xcframework
