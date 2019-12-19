module ApplicationHelper
  def page_title
	  title = "HobbyShop NS"
		title = @page_title + " | " + title if @pafe_title
		title
  end
end
