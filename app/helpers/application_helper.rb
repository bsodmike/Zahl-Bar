module ApplicationHelper
  def pluralize_without_count(count, noun)
    if count != 0
      count == 1 ? noun : noun.pluralize
    end
  end

  def formatted_date(datetime)
    DateTime.parse(datetime.to_date.to_s).strftime('%A, %d %B %Y').to_s
  end
end
