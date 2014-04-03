module CoastersHelper
  def img_url(coaster)
    if coaster.image_url.blank?
      coaster.image_url = "http://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Roller_Coaster_Icon.svg/200px-Roller_Coaster_Icon.svg.png"
    end
    coaster.image_url
  end
end
