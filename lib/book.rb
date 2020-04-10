require 'date'
class Book
    attr_accessor :title, :author, :category, :available, :loanee, :return_date
    DEFAULT_LOAN_DURATION_DAYS = 30
    def initialize(attrs = {})
        @title = set_title(attrs[:title])
        @author = set_author(attrs[:author])
        @category = set_category(attrs[:category])
        @available = true
        @loanee 
        @return_date
    end

    def checkout(person)
        @loanee = person
        @return_date = Date.today.next_day(DEFAULT_LOAN_DURATION_DAYS)
        @available = false
    end

    def return_book
        @loanee = nil
        @return_date = nil
        @available = true        
    end

    private

    def set_title(title)
        title == nil ? missing_title : title
    end

    def set_author(author)
        author == nil ? missing_author : author
    end

    def set_category(category)
        category == nil ? missing_category : category
    end

    def missing_author
        raise "Book must have an author"
    end

    def missing_title
        raise "Book must have a title"
    end

    def missing_category
        raise "Book must have a category"
    end

end