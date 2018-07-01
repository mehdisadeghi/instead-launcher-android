package org.emunix.insteadlauncher.ui.game

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import kotlinx.android.synthetic.main.fragment_game.*
import org.apache.commons.io.FileUtils
import org.emunix.insteadlauncher.R
import org.emunix.insteadlauncher.data.Game
import org.emunix.insteadlauncher.data.Game.State.*
import org.emunix.insteadlauncher.helpers.loadUrl
import org.emunix.insteadlauncher.helpers.visible
import org.emunix.insteadlauncher.services.DeleteGame
import org.emunix.insteadlauncher.services.InstallGame

class GameFragment : Fragment() {

    private lateinit var viewModel: GameViewModel

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_game, container, false)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)

        val bundle = this.arguments
        if (bundle != null) {
            val gameName = bundle.getString("game_name")
            viewModel = ViewModelProviders.of(this).get(GameViewModel::class.java)
            viewModel.init(gameName)
            viewModel.getGame().observe(this, Observer { game ->
                if (game != null) {
                    setViews(game)
                } else {
                    //todo показать ошибку, что такой игры не найдено в базе
                }
            })
        }
    }

    private fun setViews(game: Game) {
        val activity = activity as AppCompatActivity
        activity.supportActionBar?.title = game.title

        name.text = game.title
        author.text = game.author
        version.text = getString(R.string.game_activity_label_version, game.version)
        size.text = getString(R.string.game_activity_label_size, FileUtils.byteCountToDisplaySize(game.size))
        image.loadUrl(game.image)
        description.text = game.description

        if (game.state == INSTALLED) {
            installButton.text = getText(R.string.game_activity_button_run)
            showProgress(false)
        }

        if (game.state == NO_INSTALLED) {
            installButton.text = getText(R.string.game_activity_button_install)
            installButton.visible(true)
            deleteButton.visible(false)
            progressBar.visible(false)
            installMessage.visible(false)
        }

        if (game.state == IS_INSTALL) {
            installMessage.text = getString(R.string.notification_download_and_install_game)
            showProgress(true)
        }

        if (game.state == IS_DELETE) {
            installMessage.text = getString(R.string.notification_delete_game)
            showProgress(true)
        }

        installButton.setOnClickListener {
            if (game.state == NO_INSTALLED) {
                val installGame = Intent(activity, InstallGame::class.java)
                installGame.putExtra("game_url", game.url)
                installGame.putExtra("game_name", game.name)
                activity.startService(installGame)
            }

            if (game.state == INSTALLED) {
                // todo run game
            }
        }

        deleteButton.setOnClickListener {
            if (game.state == INSTALLED) {
                val deleteGame = Intent(activity, DeleteGame::class.java)
                deleteGame.putExtra("game_name", game.name)
                activity.startService(deleteGame)
            }
        }
    }

    private fun showProgress(flag: Boolean) {
        installMessage.visible(flag)
        progressBar.visible(flag)
        installButton.visible(!flag)
        deleteButton.visible(!flag)
    }
}