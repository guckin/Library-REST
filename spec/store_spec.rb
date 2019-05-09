require_relative 'mocks/db_mock'
describe Library::Store do

  before :each do
    @data = []
    @mock_db = DBMock.new @data
    @store = Library::Store.new(db: @mock_db)
  end

  def book_arrays_equal?(one, two)
    one.map(&:to_hash) == two.map(&:to_hash)
  end

  it 'retrieves multiple books with the same title' do
    title = 'foo'
    test_data = [{title: title, author: 'Stephen', id: '123'},
                 {title: title, author: 'Stephen', id: '345'}]
    @data.append(*test_data)
    result = @store.retrieve_book(title: title)
    expected = test_data.map { |book| BookRecord.new book }
    expect(book_arrays_equal?(result, expected)).to be_truthy
  end
end