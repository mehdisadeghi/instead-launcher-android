package org.emunix.insteadlauncher.ui.instead

import android.content.pm.ActivityInfo
import android.graphics.Point
import android.os.Bundle
import android.view.KeyEvent
import android.view.Window
import android.view.WindowManager
import androidx.preference.PreferenceManager
import org.emunix.insteadlauncher.helpers.StorageHelper
import org.libsdl.app.SDLActivity
import java.util.*


class InsteadActivity: SDLActivity() {

    private lateinit var game : String
    private var playFromBeginning = false

    private lateinit var inputLayout: InputLayout

    private var prefMusic: Boolean = true
    private var prefCursor: Boolean = false
    private var prefBuiltinTheme: Boolean = true
    private lateinit var prefDefaultTheme: String
    private var prefHires: Boolean = true
    private lateinit var prefTextSize: String
    private lateinit var prefKeyboardButton: String
    private lateinit var prefBackButton: String


    override fun getLibraries(): Array<String> {
        return arrayOf("SDL2",
                "SDL2_image",
                "SDL2_mixer",
                "SDL2_ttf",
                "lua",
                "charset",
                "iconv",
                "instead")
    }

    override fun getArguments(): Array<String> {
        val args : Array<String> = Array(13){""}
        args[0] = StorageHelper(this).getDataDirectory().absolutePath
        args[1] = StorageHelper(this).getAppFilesDirectory().absolutePath
        args[2] = StorageHelper(this).getGamesDirectory().absolutePath
        args[3] = StorageHelper(this).getThemesDirectory().absolutePath
        args[4] = Locale.getDefault().language
        args[5] = if (prefMusic) "y" else "n"
        args[6] = if (prefCursor) "y" else "n"
        args[7] = if (prefBuiltinTheme) "y" else "n"
        args[8] = prefDefaultTheme
        args[9] = if (prefHires) "y" else "n"
        args[10] = prefTextSize
        args[11] = if (playFromBeginning) "y" else "n"
        args[12] = game
        return args
    }

    private fun enableHWA() {
        window.setFlags(
                WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED,
                WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        // The following line is to workaround AndroidRuntimeException: requestFeature() must be called before adding content
        requestWindowFeature(Window.FEATURE_NO_TITLE)
        enableHWA()
        super.onCreate(savedInstanceState)

        game = intent.extras.getString("game_name")
        playFromBeginning = intent.extras.getBoolean("play_from_beginning", false)

        getPreferences()

        if (prefKeyboardButton != "do_not_show_button") {
            inputLayout = InputLayout(this)
            inputLayout.setGravity(prefKeyboardButton)
            addContentView(inputLayout, InputLayout.params)
        }
    }

    private fun getPreferences() {
        val prefs = PreferenceManager.getDefaultSharedPreferences(this)
        prefMusic = prefs.getBoolean("pref_music", true)
        prefCursor = prefs.getBoolean("pref_cursor", false)
        prefBuiltinTheme = prefs.getBoolean("pref_enable_game_theme", true)
        prefDefaultTheme = prefs.getString("pref_default_theme", "mobile")
        prefHires = prefs.getBoolean("pref_hires", true)
        prefTextSize = prefs.getString("pref_text_size", "150")
        prefKeyboardButton = prefs.getString("pref_keyboard_button", "do_not_show_button")
        prefBackButton = prefs.getString("pref_back_button", "exit_game")
    }

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        if (event.keyCode == KeyEvent.KEYCODE_BACK) {
            if (event.action == KeyEvent.ACTION_DOWN && event.repeatCount == 0) {
                if (prefBackButton == "open_menu") {
                    keyDispatcherState.startTracking(event, this)
                    return true
                }
            } else if (event.action == KeyEvent.ACTION_UP) {
                keyDispatcherState.handleUpEvent(event)
                if (event.isTracking && !event.isCanceled) {
                    if (prefBackButton == "open_menu") {
                        toggleMenu()
                        return true
                    }
                }
            }
            return super.dispatchKeyEvent(event)
        } else {
            return super.dispatchKeyEvent(event)
        }
    }

    private external fun toggleMenu()

    override fun onPause() {
        if (prefKeyboardButton != "do_not_show_button") {
            inputLayout.close()
        }
        super.onPause()
    }

    companion object {
        // This method is called by native instead_launcher.c using JNI.
        @JvmStatic
        fun unlockRotation() {
            mSingleton.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED
        }

        @JvmStatic
        private fun getScreenSize(): String {
            val display = mSingleton.windowManager.defaultDisplay
            val size = Point()
            display.getSize(size)
            return "${size.x}x${size.y}"
        }
    }

}