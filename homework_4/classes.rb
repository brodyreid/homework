class Book
    attr_reader(:title, :authors, :edition)

    def initialize(title, authors, edition)
            @title = title
            @authors = authors
            @edition = edition
    end
end

class Library
    def initialize
        @book_list = []
    end

    def shelve(book) # shelving method
        @book_list << book
        @book_list.sort_by!(&:title) # organize library alphabetically
        self
    end

    def list # viewing method
        p @book_list
    end

    def find_by_title(word) # find by title method
        p @book_list.find { |book| book.title.downcase.include? word.downcase }
    end
end



# big_boi = Books.new("Biggest Boi", ["Erman Hamwell, Jan Shimbo"], 12)
# smol_egg = Books.new("Smallest Egg", ["Egmuhnd Jol, Kandus Ollort"], 3)

# mylib = Library.new

# mylib.shelve(smol_egg).shelve(big_boi)

# mylib.list

# mylib.find_by_title("EGG") # prints #<Books:0x00007fa6a4093bc8 @title="Smallest Egg", @authors=["Egmuhnd Jol, Kandus Ollort"], @edition=3>

