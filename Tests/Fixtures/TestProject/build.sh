#!/bin/bash
set -e

carthage bootstrap --cache-builds
echo "
Building iOS app"
xcodebuild -project Project.xcodeproj -scheme "App_iOS Test" -configuration "Test Debug" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO | xcpretty
echo "
Building macOS app"
xcodebuild -project Project.xcodeproj -scheme "App_macOS" -configuration "Test Debug" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO | xcpretty
