module ApplicationHelper
	def nice_time(time)
		time.localtime.strftime("%-m/%-d/%Y %l:%M %P")
	end
end
