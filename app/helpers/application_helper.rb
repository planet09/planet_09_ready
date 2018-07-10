module ApplicationHelper

  def flash_message(type)
    case type
      when "alert" then "alert alert-warning"
      when "notice" then "alert alert-primary"
    end
  end

  def gravatar(user)
    if user
      email = Digest::MD5.hexdigest(user.email)
      url = "https://s.gravatar.com/avatar/#{email}?s=80&d=mp"
      image_tag(url, alt: user.name, class: "rounded-circle")
    end
  end
  
end
