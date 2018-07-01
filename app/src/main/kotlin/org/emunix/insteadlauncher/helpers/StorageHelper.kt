package org.emunix.insteadlauncher.helpers

import android.content.Context
import android.os.Environment
import androidx.core.os.EnvironmentCompat
import java.io.File

class StorageHelper(val context: Context) {

    fun getAppSubDirectory(dir: String) : File {
        val storage : Array<File> = context.getExternalFilesDirs(dir)
        for (file in storage) {
            if (file != null) {
                val state = EnvironmentCompat.getStorageState(file)
                if (Environment.MEDIA_MOUNTED == state) {
                    return file
                }
            }
        }
        // if external not presented use internal memory // todo check this
        return context.filesDir
    }

    fun getGamesDirectory(): File = getAppSubDirectory("games")

}