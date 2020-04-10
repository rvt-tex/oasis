module ApplicationHelper

    def display_date(d)
        d.strftime('%A, %B %d, %Y')
    end
    
    def display_time(d)
        d.strftime('%I:%M %p')
    end
end
