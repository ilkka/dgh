Given /^there are no downgradable packages$/ do
  @policyfile = File.join(File.dirname(__FILE__), '..', 'support', 'policy_no_candidates.out') 
end

When /^I run dgh$/ do
  @output = `#{File.join(File.dirname(__FILE__), '..', '..', 'bin', 'dgh')} #{@policyfile}`
end

Then /^no packages should be reported as downgrade candidates$/ do
  @output.should == ""
end

Given /^there are some downgradable packages$/ do
  @policyfile = File.join(File.dirname(__FILE__), '..', 'support', 'policy.out') 
end

Then /^those packages should be reported as downgrade candidates$/ do
  @output.should match /git-flow\nveracity\npicasa/
end

