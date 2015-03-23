require 'rspec'
require_relative 'playlist'
require_relative 'song'


describe Playlist do
  before :each do
   @song1 =  Song.new('It had to be you',  100)
   @song2 =  Song.new( 'But Not for Me',  50)
   @song3 =  Song.new( 'Autumn In New York',  25)
 end

  it 'is created with a name' do
    playlist = Playlist.new('playlist')
    expect(playlist.name).to eq("playlist")
  end

  it 'is empty be default' do
    playlist = Playlist.new('playlist')

    expect(playlist.is_empty?).to equal(true)
  end


  it 'allows you to add a song' do

    playlist = Playlist.new('playlist')

    playlist.add_song(@song1)

    expect(playlist.is_empty?).to equal(false)
  end

  it 'allows you to see all song s in the order they were added' do

    playlist = Playlist.new('playlist')

    playlist.add_song(@song1)
    playlist.add_song(@song2)
    playlist.add_song(@song3)


    expect(playlist.songs).to eq([@song1, @song2, @song3])
    expect(playlist.name).to eq("playlist")
  end

  it 'allows you to remove a song from the playlist' do

    playlist = Playlist.new('hi')

    playlist.add_song(@song1)
    playlist.add_song(@song2)
    playlist.add_song(@song3)

    playlist.remove_song(@song1)

    expect(playlist.songs).to eq([@song2, @song3])
  end

  it 'allows you to see the names of all the songs' do

    playlist = Playlist.new('playlist')
    playlist.add_song(@song1)
    playlist.add_song(@song2)

    expect(playlist.song_names).to eq(['It had to be you', 'But Not for Me'])

  end

  it 'allows you to swap songs' do

    playlist = Playlist.new('hi')

    playlist.add_song(@song1)
    playlist.add_song(@song2)
    playlist.add_song(@song3)
    playlist.add_song(@song4)

    playlist.swap(@song4, @song1)

    expect(playlist.songs).to eq([@song4, @song2, @song3, @song1])
  end

  it 'tells total length of playlist' do

    playlist = Playlist.new('hi')

    playlist.add_song(@song1)
    playlist.add_song(@song2)
    playlist.add_song(@song3)

    expect(playlist.total_length).to eq(175)
  end

    it 'allows you to play a song' do

      playlist = Playlist.new("hi")

      playlist.add_song(@song1)
      playlist.add_song(@song2)
      playlist.add_song(@song3)

      expect(playlist.now_playing).to eq(nil);

      playlist.play
      expect(playlist.now_playing).to eq(@song1)
    end

    it 'allows you to go to the next song' do

      playlist = Playlist.new("hi")

      playlist.add_song(@song1)
      playlist.add_song(@song2)
      playlist.add_song(@song3)

      expect(playlist.now_playing).to eq(nil);
      playlist.play
      expect(playlist.now_playing).to eq(@song1)
      playlist.next
      expect(playlist.now_playing).to eq(@song2)

    end

end
