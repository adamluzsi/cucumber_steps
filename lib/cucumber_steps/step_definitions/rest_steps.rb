require 'cucumber_steps/rest'

World(CucumberSteps::Support::RestMethods)

And(/I send a "(\w+)" request to: *(.+)/) do |http_method,url|
  rest_call(http_method,url,{},{})
end

And(/the rest response body is:/) do |expected_response_body|
  expect(last_response.body).to eq expected_response_body
end

And(/the rest response body should match: \/(.*)\/$/) do |expected_response_body_regexp|
  expect(last_response.body).to match(Regexp.new(expected_response_body_regexp))
end

And(/the rest response status code is: (\d+)/) do |http_status_code|
  expect(last_response.status).to eq http_status_code.to_i
end

And(/the rest response has the following headers:/) do |table|
  table.transpose.hashes.first.each do |header_key,expected_value|
    expect(last_response.headers[header_key]).to eq expected_value
  end
end