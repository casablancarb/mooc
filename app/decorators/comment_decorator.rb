class CommentDecorator < BaseDecorator
  def user_role
    user.is_teacher? ? 'teacher' : 'student'
  end

  def author
    user.firstname
  end

  def gravatar
    hash = Digest::MD5.hexdigest(user.email)
    "http://www.gravatar.com/avatar/#{hash}?d=identicon"
  end

  def time_ago_in_words
    h.time_ago_in_words(created_at)
  end
end
