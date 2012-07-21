module CategoriesHelper
  def id_to_category(catid)
    if catid == 5
      return 'General'
    end
    if catid == 6
      return 'Cultural'
    end
    if catid == 7
      return 'Japanese Particles'
    end
    if catid == 8
      return 'Freestyle'
    end
    if catid == 9
      return 'Main Story'
    end
    if catid == 10
      return 'Side Story'
    end
  end
end
