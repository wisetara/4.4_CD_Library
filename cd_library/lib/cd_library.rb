class Cdisc

  attr_reader :artist, :album, :songs

  @@all = []

  def initialize(attributes)
    @artist = attributes[:artist]
    @album = attributes[:album]
    @songs = attributes[:songs]
  end

  def Cdisc.create(attributes)
    new_cd = Cdisc.new(attributes)
    new_cd.save
    new_cd
  end

  def Cdisc.all
    @@all
  end

  def Cdisc.clear
    @@all = []
  end

  def save
    @@all << self
  end

  #def Cdisc.search(name)
   # Cdisc.all.each do |cd|
    #  if cd.artist == name || cd.album == name || cd.songs == name
    #end

  def Cdisc.search_artist(name)
    Cdisc.all.each do |cd|
      if cd.artist == name
      return cd
      end
    end
  end

  def Cdisc.search_album(name)
    Cdisc.all.each do |cd|
      if cd.album ==  name
    end
     return cd
    end
  end

  def Cdisc.search_songs(name)
    Cdisc.all.each do |cd|
      if cd.songs ==  name
    end
      return cd
    end
  end
end
