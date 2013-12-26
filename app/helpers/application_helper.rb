module ApplicationHelper
	# Get user's gravatar according to his/her email.
  def gravatar_for user, options = {css_class: ""}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    css_class = options[:css_class]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url, alt: user.name, class: "user-avatar #{css_class}"
  end
end
