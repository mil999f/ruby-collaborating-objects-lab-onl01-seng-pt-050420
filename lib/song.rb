class Song 
  attr_accessor :name, :artist , :title
  @@all =[]
  
  def initialize(name)
    @name = name
    save
  end
  
  def save
   @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    song_title = self.new(song)
    song_title.artist_name = artist
    song_title
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
end