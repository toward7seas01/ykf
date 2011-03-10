class Report
  def initialize(head, body)
    @head = head
    @body = body

    @book = Spreadsheet::Workbook.new
    @sheet = @book.create_worksheet
    @path = "#{Rails.root}/public/data/#{UUID.new.generate}.xls"
  end

  def write
    ([@head] + @body.to_a).each_with_index do |row, index|
      @sheet.row(index).push(*row)
    end

    @book.write(@path)
    @path
  end
end
