module ApplicationHelper
  def is_admin?
    current_user.try(:is_admin?)
  end
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
  def Persian_to_english_date(str)
    str = str.to_english          
    if(/^\d\d\d\d.(\d\d|\d).(\d\d|\d)$/.match str)
      dl = str.to_english.split("/")
      fa_date = JalaliDate.new(dl[0].to_i,dl[1].to_i,dl[2].to_i)
      fa_date.to_gregorian
    end
  end
end
