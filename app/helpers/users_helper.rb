module UsersHelper
  def avatar_for user, options = {size: 50}
    size = options[:size]
    name = options[:name] || user.name
    url = size <= 50 ? user.avatar.thumb.url : user.avatar.url
    image_tag(url, alt: name, title: name, size: "#{size}x#{size}",
             class: "avatar")
  end
end
