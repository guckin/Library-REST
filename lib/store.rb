require_relative 'book_record'
module Library
  class Store

    def initialize(db:)
      @db = db
    end

    def retrieve_book(title:)
      books_data = @db.query title: title
      books_data.map { |book| BookRecord.new book}
    end
  end
end