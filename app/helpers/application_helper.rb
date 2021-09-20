module ApplicationHelper
  def format_date(date, format = '%m %B %Y')
    Date.parse(date).strftime(format)
  end
end
