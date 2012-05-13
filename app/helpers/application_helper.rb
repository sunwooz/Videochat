module ApplicationHelper
  
private
  def admin?
    if current_user
      if current_user.email == "yangsunwoo@gmail.com"
        current_user
      end
    else
      nil
    end
    
  end
end
