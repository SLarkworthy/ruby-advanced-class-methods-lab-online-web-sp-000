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
    puts @@all.sort_by{|song| song.name}
  end

end
