require_relative 'song'

class Playlist

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    @play_song = nil
    @song_number = 0
  end

  def name
    @name
  end

  def is_empty?
    if @songs.length == 0
      true
    else
      false
    end
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def remove_song(song)
    @songs.delete(song)
  end

  def song_names
    a = []
    @songs.each do |song|
      a << song.name
    end
    a
  end

  def swap(song1, song2)
    hash = Hash[@songs.map.with_index.to_a]
    @songs[hash[song1]], @songs[hash[song2]] = @songs[hash[song2]], @songs[hash[song1]]
  end

  def total_length
    a = 0
    @songs.each do |song|
      a += song.length
    end
    a
  end

  def now_playing
    @play_song
  end

  def play
    @play_song = @songs[@song_number]
  end

  def next
    @song_number += 1
    self.play
  end

end
