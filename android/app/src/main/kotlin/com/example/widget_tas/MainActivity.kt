package com.example.widget_tas

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.os.Bundle
import com.example.widget_tas.R
import android.widget.RemoteViews
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {
    private val CHANNEL = "testChannel"
    private var phoneNumbers = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        provideFlutterEngine(this)?.let { GeneratedPluginRegistrant.registerWith(it) }
        MethodChannel(flutterEngine!!.getDartExecutor(), CHANNEL).setMethodCallHandler { call, result ->
            if (call.method.equals("testMethod")) {
               val colorText : String? = call?.argument("color")

               val context: Context = this
                    val appWidgetManager = AppWidgetManager.getInstance(context)
                    val remoteViews = RemoteViews(context.packageName, R.layout.new_app_widget)
                    val thisWidget = ComponentName(context, NewAppWidget::class.java)

                    remoteViews.setTextViewText(
                        R.id.appwidget_text,
                        colorText
                    )
                if(colorText == "red") {
                    remoteViews.setInt(R.id.appwidget_text, "setBackgroundColor",
                        android.graphics.Color.RED);
                } else if(colorText == "green") {
                    remoteViews.setInt(R.id.appwidget_text, "setBackgroundColor",
                        android.graphics.Color.GREEN);
                } else if(colorText == "blue") {
                    remoteViews.setInt(R.id.appwidget_text, "setBackgroundColor",
                        android.graphics.Color.BLUE);
                }
                appWidgetManager.updateAppWidget(thisWidget, remoteViews)
            }
        }
    }
}
