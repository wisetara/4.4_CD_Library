require 'rspec'
require 'cd_library'

describe Cdisc do
  before do
    Cdisc.clear
  end

  describe 'initialize' do
   it'is initilized with a hash of attributes' do
    test_cd = Cdisc.new({:artist => 'Madonna', :album => 'True Blue', :songs => 'Live to Tell'})
    test_cd.should be_an_instance_of Cdisc
   end
  end

  describe ".create" do
    it 'creates a new Cdisc object' do
      test_cd = Cdisc.create({:artist => 'Madonna', :album => 'True Blue', :songs => 'Live to Tell'})
      test_cd.artist.should eq 'Madonna'
  end

  it 'saves the new Cdisc object into array' do
      test_cd = Cdisc.create({:artist => 'Madonna', :album => 'True Blue', :songs => 'Live to Tell'})
      Cdisc.all.should eq [test_cd]
    end
  end

  describe ".search_artist" do
    it 'searches the cd library with an artist name and returns the complete info for the cd' do
      test_cd_1 = Cdisc.create({:artist => 'Mumford & Sons', :album => 'Babel', :songs => 'I Will Wait'})
      test_cd_2 = Cdisc.create({:artist => 'Madonna', :album => 'True Blue', :songs => 'Live to Tell'})
      Cdisc.search_artist('Mumford & Sons').should eq test_cd_1
    end
  end

  describe ".search_album" do
    it 'searches the cd library with an album name and returns the complete info for the cd' do
       test_cd = Cdisc.create({:artist => 'Madonna', :album => 'True Blue', :songs => 'Live to Tell'})
       Cdisc.search_album('True Blue').should eq test_cd
    end
  end

  describe ".search_songs" do
    it 'searches the cd library with a song name and returns the complete info for the cd' do
       test_cd = Cdisc.create({:artist => 'Madonna', :album => 'True Blue', :songs => 'Live to Tell'})
       Cdisc.search_songs('Live to Tell').should eq test_cd
    end
  end
end
