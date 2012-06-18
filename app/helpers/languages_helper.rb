module LanguagesHelper
  def id_to_language(testid)
    if testid == 11
      return 'Chinese'
    end
    if testid == 10
      return 'English'
    end
  end
end
