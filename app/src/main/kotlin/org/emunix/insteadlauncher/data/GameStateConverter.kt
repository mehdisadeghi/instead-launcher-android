package org.emunix.insteadlauncher.data

import android.arch.persistence.room.TypeConverter

class GameStateConverter {
    @TypeConverter
    fun toState(ordinal: Int): Game.State = Game.State.values()[ordinal]

    @TypeConverter
    fun toOrdinal(state: Game.State): Int? = state.ordinal
}
