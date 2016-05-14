class TootPresenter < SimpleDelegator

  def body_with_links
    matches = body.scan(/@(\w*)/).flatten

    user_replace_hash = {}
    matches.each do |match|
      if user = User.find_by(username: match)
        user_replace_hash["@#{match}"] = "<a href='/users/#{user.id}'>@#{match}</a>"
      end
    end

    body.gsub(/@\w*/, user_replace_hash).html_safe
  end

end
