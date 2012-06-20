module LanguagesHelper
  def id_to_language(testid)
    if testid == 11
      return 'Chinese'
    end
    if testid == 10
      return 'English'
    end
    if testid == 12
      return 'Japanese'
    end
  end
end
