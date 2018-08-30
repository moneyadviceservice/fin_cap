VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday

  c.around_http_request do |request|
    uri = URI(request.uri)

    if ENV['FINCAP_CMS_URL'].match?(/#{uri.host}/)
      raw_query = uri.query || ''
      query = CGI.unescape(raw_query).gsub(
        /blocks\[\]\[identifier\]=.*&blocks\[\]\[value\]=/, 'filter'
      )

      VCR.use_cassette(
        "/fincap_cms/#{request.method}#{uri.path}#{query}",
        allow_playback_repeats: true,
        &request
      )
    end
  end

  # As we deal with API responses in JSON only, we have to enforce UTF-8
  # in order to avoid the body to be stored as a binary string
  # More info: https://stackoverflow.com/a/25571825
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end
