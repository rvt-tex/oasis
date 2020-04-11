module ApplicationHelper

    
    def footer_class
        'page-footer row bg-light'
    end

    def main_col_class(text)
        content_for :main_col_class, text
    end

    def title(text)
        content_for :title, text
    end
end
