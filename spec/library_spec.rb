require "./lib/library.rb"

describe Library do
    let(:visitor) { class_double('visitor', name: 'erik') }
    it 'can read the YAML file with all the books' do
        expected_output = YAML.load_file('./lib/inventory.yml')
        expect(subject.books).to eq expected_output
    end

    it 'can search for a book by its title' do
        expected_output = YAML.load_file('./lib/inventory.yml').select { |book| book[:title].include? 'Pippi' }
        expect(subject.search_by_title('Pippi')).to eq expected_output
    end

    it 'allow visitor to check-out book if avaiable' do
        expected_output = check_out(book)
        expect(subject.check_out).to be expected_output
    end

    # it 'can search for a book by its author' do
    #     expect(subject.search_by_author).to eq ??
    # end

    # it 'return avaiable if the status of book is avaiable' do
    #     expect(subject.books_status).to eq :availeble
    # end

    # it 'return borrowed if the status of the book is non-available' do
    #     expect(subject.books_status).to eq :borrowed
    # end

    # it 'is expected to raise error if the book does not exist in the library' do
    #     # expect { described_class.new }.to raise_error 'The book does not exist'
    # end
    
    # it 'is expected to have an return date on initialize' do
    #     expected_date = Date.today.next_month(1).strftime("%d/%m")
    #     expect(subject.return_date).to eq expected_date
    # end
end