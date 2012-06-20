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
  end
end
