Given(/^I setup for the "(.*?)" service$/) do |srvc_name|
  @srvc = Services.const_get(srvc_name.to_sym).new
end

When(/^I make a "(.*?)" call on route "(.*?)" with parameters "(.*?)"$/) do |http_call, http_route, http_params|
  http_call = http_call.downcase.to_sym
  @response = @srvc.method(http_call).call(http_route, http_params)
end

Then(/^the service returns the status code "(.*?)"$/) do |resp_code|
  expect(@response.code).to eql resp_code.to_i
end

Then(/^the service returns the content\-type "(.*?)"$/) do |cont_type|
  expect(@response.headers['content-type']).to eq cont_type.gsub("'","")
end

Then(/^the service returns the body "(.*?)"$/) do |resp_body|
  expect(@response.body).to eq resp_body.gsub("'","")
end
