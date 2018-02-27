VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday

  c.around_http_request do |request|
    uri = URI(request.uri)

    if ENV['FINCAP_CMS_URL'].match?(/#{uri.host}/)
      VCR.use_cassette(
        "/fincap_cms/#{request.method}#{uri.path}#{uri.query}",
        allow_playback_repeats: true,
        &request
      )
    end
  end
end
