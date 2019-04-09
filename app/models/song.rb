class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(content)
    content.each {|element|
      x = Note.new(content: element)
      self.notes << x
      # x.save
      # self.save
      ## good practice, use .save's in a larger app
    }
  end

  def note_contents
    contents_array = []
    self.notes.each {|note|
      if !note.content.empty?
        contents_array << note.content
      end
    }
    contents_array
  end

end
