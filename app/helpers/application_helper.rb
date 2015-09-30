module ApplicationHelper
 def full_title(page_title)
    base_title = "Sojin Portal"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
 end
 
 def br(str) 
 #http://qiita.com/t_oginogin/items/0164ad76b753fdff9902 参照
  html_escape(str).gsub(/\r\n|\r|\n/, "<br />").html_safe 
 end 

end
