class DBMock

  def initialize(data)
    @data = data
  end

  def query(title:)
    @data.select do |data|
      data[:title] == title
    end
  end
end