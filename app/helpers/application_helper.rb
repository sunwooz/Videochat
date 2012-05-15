module ApplicationHelper
  
  def markdown(text)
    Redcarpet.new(text).to_html.html_safe
  end
  
private
  def admin?
    # if current_user
    #       if current_user.email == "yangsunwoo@gmail.com"
    #         current_user
    #       end
    #     else
    #       nil
    #     end
    puts 'cheese'
  end
  
end
