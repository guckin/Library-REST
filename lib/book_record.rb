class BookRecord
  attr_reader :title
  attr_reader :author
  attr_reader :id

  def initialize(title:, author:, id:)
    @title = title
    @author = author
    @id = id
  end

  def to_hash
    {title: title,
    author: author,
    id: id}
  end
end