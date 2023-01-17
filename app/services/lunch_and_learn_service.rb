class LunchAndLearnService
	def post_user(form_data)
		post_url("/api/v1/users", form_data.to_json)
	end

  def post_session(form_data)
		post_url("/api/v1/sessions", form_data.to_json)
	end

	def post_url(url, form_data)
		JSON.parse(conn.post(url, form_data).body, symbolize_names: true)
	end

	def conn
		Faraday.new(url: 'http://localhost:5001') do |f|
      f.headers[:content_type] = 'application/json'
			f.adapter Faraday.default_adapter
		end
	end
end