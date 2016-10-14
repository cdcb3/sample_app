module UsersHelper

  def gravatar_for(user, options = {})
    gravatar_id   = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url  = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: "gravatar_test", class: "gravatar")
  end

  def has_error(user)
    return pluralize_without_count(user.errors.count, "error") if user.errors.any?
    return ''
  end

end
