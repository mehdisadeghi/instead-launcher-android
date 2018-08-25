package org.emunix.insteadlauncher.data

import androidx.lifecycle.LiveData
import androidx.room.*

@Dao
interface GameDao {
    @Query("SELECT * FROM games")
    fun observeAll(): LiveData<List<Game>>

    @Query("SELECT * FROM games WHERE name LIKE :name LIMIT 1")
    fun observeByName(name: String): LiveData<Game>

    @Query("SELECT * FROM games WHERE name LIKE :name LIMIT 1")
    fun getByName(name: String): Game

    @Query("SELECT * FROM games WHERE state = 1")
    fun observeInstalledGames(): LiveData<List<Game>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insert(game: Game)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insertAll(games: List<Game>)

    @Update
    fun update(game: Game)

    @Delete
    fun delete(game: Game)

    @Query("DELETE FROM games")
    fun deleteAll()
}
