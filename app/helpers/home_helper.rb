module HomeHelper
  def generate_url(shortened_url)
    "#{request.base_url}/#{shortened_url}"
  end

  def generate_badge(url)
    content_tag(
        :span,
        url.status.humanize,
        class: "badge badge-pill #{define_badge(url.status)}"
    )
  end

  def define_badge(url_status)
    case url_status
    when 'up'
      'badge-success'
    when 'down'
      'badge-danger'
    else
      'badge-info'
    end
  end
end
