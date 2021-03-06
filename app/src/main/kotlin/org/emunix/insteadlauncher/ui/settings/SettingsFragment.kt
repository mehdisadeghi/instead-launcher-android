/*
 * Copyright (c) 2018-2020 Boris Timofeev <btimofeev@emunix.org>
 * Distributed under the MIT License (license terms are at http://opensource.org/licenses/MIT).
 */

package org.emunix.insteadlauncher.ui.settings

import android.content.SharedPreferences
import android.os.Bundle
import androidx.preference.EditTextPreference
import androidx.preference.ListPreference
import androidx.preference.PreferenceFragmentCompat
import androidx.preference.SwitchPreference
import org.emunix.insteadlauncher.InsteadLauncher
import org.emunix.insteadlauncher.R
import org.emunix.insteadlauncher.helpers.ThemeHelper
import org.emunix.insteadlauncher.services.UpdateRepositoryWork


class SettingsFragment : PreferenceFragmentCompat(), SharedPreferences.OnSharedPreferenceChangeListener {

    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        setPreferencesFromResource(R.xml.preferences, rootKey)
    }

    override fun onSharedPreferenceChanged(sharedPreferences: SharedPreferences,
                                           key: String) {
        when (key) {
            "pref_repository" -> {
                val repo : EditTextPreference? = findPreference("pref_repository")
                if (repo != null && repo.text.isBlank()) {
                    repo.text = InsteadLauncher.DEFAULT_REPOSITORY
                }
            }
            "pref_sandbox" -> {
                val sandbox : EditTextPreference? = findPreference("pref_sandbox")
                if (sandbox != null && sandbox.text.isBlank()) {
                    sandbox.text = InsteadLauncher.SANDBOX
                }
            }
            "app_theme" -> {
                val theme : ListPreference? = findPreference("app_theme")
                if (theme != null) {
                    ThemeHelper.applyTheme(theme.value)
                }
            }
            "pref_update_repo_background" -> {
                val pref : SwitchPreference? = findPreference("pref_update_repo_background")
                if (pref != null && pref.isChecked) {
                    UpdateRepositoryWork.start(requireContext())
                } else {
                    UpdateRepositoryWork.stop(requireContext())
                }
            }
        }
    }

    override fun onResume() {
        super.onResume()
        preferenceScreen.sharedPreferences.registerOnSharedPreferenceChangeListener(this)
    }

    override fun onPause() {
        super.onPause()
        preferenceScreen.sharedPreferences.unregisterOnSharedPreferenceChangeListener(this)
    }
}
