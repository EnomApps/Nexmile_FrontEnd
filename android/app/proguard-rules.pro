# Flutter's own embedding is kept by the Flutter Gradle plugin's consumer
# rules; these cover the plugins this app links against.
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# shared_preferences
-keep class androidx.preference.** { *; }

-dontwarn io.flutter.embedding.**

# Razorpay. Its checkout runs in a WebView that calls back through
# @JavascriptInterface methods, which R8 would otherwise strip or rename.
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keepattributes JavascriptInterface
-keepattributes *Annotation*
-dontwarn com.razorpay.**
-keep class com.razorpay.** { *; }
-optimizations !method/inlining/*
-keepclasseswithmembers class * {
    public void onPayment*(...);
}
