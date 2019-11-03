class Artist
  
  extend Concerns::Findable 
  attr_accessor :name, :songs 
  @@all = [] 
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new(name).tap{|a| a.save} # this from the QA link is super nifty
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear 
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << unless @songs.include?(song)
  end
  
  def genres 
    self.songs.collest{|s| s.genre}.uniq
  end
  
  def to_s 
    self.name
  end
  
  def save
    @@all << self 
  end
 
end
