module ApplicationHelper
  def highlight_if_equal(a, b)
    'yellow-fade' if a == b
  end
end
