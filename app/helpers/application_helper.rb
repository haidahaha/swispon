module ApplicationHelper
  def daysDiff(fromDate)
    diff = Time.zone.now - fromDate
    color =
      if diff < 1.day
        ""
      elsif 1.day <= diff && diff < 2.days
        "success"
      elsif 2.days <= diff && diff < 3.days
        "warning"
      else
        "danger"
      end
    return color
  end
end
