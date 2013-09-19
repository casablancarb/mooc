class CommentDecorator < BaseDecorator
  def user_role
    user.is_teacher? ? 'teacher' : 'student'
  end

  def author
    user.firstname
  end
end
