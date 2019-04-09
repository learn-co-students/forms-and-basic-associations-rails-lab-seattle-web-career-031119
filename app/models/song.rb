class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre ? genre.name : nil
  end

  def song_genre_id
    genre ? genre.id : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_contents=(new_notes)
    new_notes.each do |note|
      @new_note = Note.find_or_create_by(content: note)
      self.notes << @new_note if !note.empty?
    end
  end

  def note_contents
    notes.map(&:content)
  end
end
