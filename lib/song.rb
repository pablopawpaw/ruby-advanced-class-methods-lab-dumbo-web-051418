require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name
    @artist_name
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.create_by_name name
    new_song = self.new_by_name(name)
  end

  def self.find_by_name name
    @@all.find do |song_name|
      song_name.name == name
    end
  end

  def self.find_or_create_by_name name
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename filename
    artist = filename.split(" - ").first
    song_name = filename.split(" - ").last.split(".mp3")
    # binding.pry
    new_song = self.new_by_name(song_name[0])
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename filename
    new_song = self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
