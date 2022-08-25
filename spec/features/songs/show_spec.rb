require 'rails_helper'

RSpec.describe 'the songs show page' do

  #as as user
  #when i visit /songs/1 (where 1 is the id of a song inmy databse)
  # Then I see that song's title, and artist
  #And I do not see any of hte other songs in my database
it 'displays the song title' do
  artist = Artist.create!(name: 'Carly Rae Jepsen')
  song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
  song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
  visit "/songs/#{song.id}"

  #localhose:3000/songs/1

  #capybara lets us use below as assertions/expectations (have_content)
  expect(page).to have_content(song.title)
  expect(page).to_not have_content(song_2.title)
end

it 'displays name of artist for hte song' do 
  artist = Artist.create!(name: 'Carly Rae Jepsen')
  song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
  song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)

  visit "/songs/#{song.id}"
save_and_open_page
  expect(page).to have_content(artist.name)
  end
end