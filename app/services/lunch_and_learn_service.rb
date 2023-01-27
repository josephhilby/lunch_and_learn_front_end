class LunchAndLearnService
	def get_learning_resources(country)
		get_url("/api/v1/learning_resources?country=#{country}")
	end

	def get_random_learning_resources
		get_url("/api/v1/learning_resources")
	end

	def post_user(form_data)
		post_url("/api/v1/users", form_data.to_json)
	end

  def post_session(form_data)
		post_url("/api/v1/sessions", form_data.to_json)
	end

  def get_recipes(country)
    get_url("/api/v1/recipes?country=#{country}")
  end

  def get_random_recipes
    get_url("/api/v1/recipes")
  end

  def get_url(url)
		JSON.parse(conn.get(url).body, symbolize_names: true)
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