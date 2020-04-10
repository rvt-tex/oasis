module ApplicationHelper

    def display_date(d)
        d.strftime('%A, %B %d, %Y')
    end
    
    def display_time(d)
        d.strftime('%I:%M %p')
    end

    def footer_class
        'page-footer row bg-light'
    end

    def main_col_class(text)
        content_for :main_col_class, text
    end
end
