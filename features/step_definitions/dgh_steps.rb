Given /^that there are no downgradable packages$/ do
  # pass
end

When /^I run dgh$/ do
  @output = `#{File.join(File.dirname(__FILE__), '..', '..', 'bin', 'dgh')}`
end

Then /^no packages should be reported as downgrade candidates$/ do
  @output.should == ""
end
