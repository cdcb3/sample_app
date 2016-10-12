module ApplicationHelper
  # Returns the full title on a per-page basis.                       # Documentation comment
  def full_title(page_title)                                          # Method definition             
    base_title = "Ruby on Rails Tutorial Sample App"                  # Variable initialization
    if page_title.empty? # To check if pagetitle has string of not    # Boolean test
      base_title                                                      # Implicit return
    else
      "#{page_title} | #{base_title}"                                 # String interpolation
    end
  end

  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end
end
