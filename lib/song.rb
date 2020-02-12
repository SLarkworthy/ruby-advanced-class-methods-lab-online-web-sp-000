

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(str_name)
    song = self.new
    song.name = str_name
    song
  end
  
  def self.create_by_name(str_name)
    song = self.new
    song.name = str_name
    @@all << song
    song
  end
  
  def self.find_by_name(str_name)
    @@all.find{|song| song.name == str_name}
  end
  
  def self.find_or_create_by_name(str_name)
    if Song.find_by_name(str_name) == nil
      Song.create_by_name(str_name)
    else
      Song.find_by_name(str_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|instance| instance.name}
  end
  
  def self.new_from_filename(mp3_format)
    formatted_name = mp3_format.split(" - ")[1].split(".")[0]
    self.new_by_name(formatted_name)
    art_name = mp3_format.split(" - ")[0]
    song = self.new
    song.artist_name = art_name
    art_name
  end
  

end
