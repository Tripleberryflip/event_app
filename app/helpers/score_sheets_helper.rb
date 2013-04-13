module ScoreSheetsHelper

	def display_judges_score_sheets(customer)
		judgeName = judge.name
		out = "<div data-role=\"collapsible-set\" data-inset=\"false\"><div data-role=\"collapsible\"><h3>#{score_sheet_name} Score Sheet</h3>"
		out << "<ul data-role=\"listview\" data-inset=\"false\">"
		if judge.score_sheets.first.nil?
			out << "<td>This judge has no score sheets to display at this time.</td><td></td><td</tr>"
		else 
			judge.score_sheets.each do |score_sheet|
				score_sheet_name = score_sheet.name
				out << "<li>score_sheet_name</li>"
			end
		end
		out << "</div></div>"
		out.html_safe
	end
end

