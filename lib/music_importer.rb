class MusicImporter
  
  attr_accessor :song, :artist, :genre 
  
  def initialize(file_path, mp3_files)
    @file_path = file_path
  end
  
  def files 
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
  
  def import 
    files.each {|file| Song.create_from_filename(file) }
  end
    