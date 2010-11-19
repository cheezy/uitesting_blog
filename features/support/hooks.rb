
Before do
  @browser = Browser.new
end

After do
  @browser.close
end


After do | scenario|
  embed_screenshot("screehshot=#{Time.new.to_i}") if scenario.failed?
end
