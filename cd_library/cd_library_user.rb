require './lib/cd_library'

def main_menu
  puts "Welcome to the CD Library Learning Project!"
  puts "Press 'n' to enter a new CD into the library."
  puts "Press 'e' to edit a CD's information in the library."
  puts "Press 'l' to list all the CDs in the library."
  puts "Press 's' to search the CD library."
  puts "Press 'd' to delete an item from the CD library."
  puts "Press 'x' to exit."
  choice = gets.chomp
  case choice
    when 'n' then create_cd
    when 'e' then Cdisc.edit
    when 'l' then list_cds
    when 's' then search_cd
    when 'd' then Cdisc.delete
    when 'x' then puts "Goodbye!"
    else puts "That was not a valid entry."
  main_menu
 end
end

def create_cd
  puts "Enter the Artist's Name"
  artist = gets.chomp
  puts "Enter the Album's Name"
  album = gets.chomp
  puts "Enter the Album Songs"
  songs = gets.chomp
  new_cd = Cdisc.create({:artist => artist, :album => album, :songs => songs})
  puts new_cd
  puts "#{new_cd.artist}: #{new_cd.album} #{new_cd.songs} entered!!" "\n"
  main_menu
end

def list_cds
  Cdisc.all.each do |cd|
    puts cd.artist
   end
  main_menu
end

def search_cd
 puts "Enter 'a' to search by artist, 'b' by album and 'c' by song"
 selection = gets.chomp
 case selection
    when 'a' then by_artist
    when 'b' then by_album
    when 'c' then by_song
    else puts " Please try again"
 end
    main_menu
end

def by_artist
  puts "Enter artist's name"
  foundartist = Cdisc.search_artist(artist)
  puts foundartist
  if foundartist = []
    puts "sorry"
  main_menu
  else
    puts "#{foundartist.artist}: #{foundartist.album}: #{foundartist.songs}" "\n"
  end
end
main_menu
