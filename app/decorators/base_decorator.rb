class BaseDecorator < Draper::Decorator
  delegate_all

  def current_user
    h.current_user
  end
end
