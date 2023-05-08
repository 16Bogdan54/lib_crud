namespace :parse do

  desc "Parses library names from Wiki page"
  task wiki: :environment do
    require 'nokogiri'
    require 'open-uri'

    doc = Nokogiri::HTML(URI.open('https://en.wikipedia.org/wiki/List_of_libraries'))
    items = doc.css('li')

    100.times do |i|
      name = items[i].at_css('a')&.text

      if name&.length.to_i > 4
        Library.create(
          name: name,
          location: i % 2 == 0 ? 'Kharkiv' : 'Odessa',
          year: 2023
        )
      end

    end

  end

end