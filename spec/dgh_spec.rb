require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

PolicyOutputWithDowngradable = <<EOS
avahi-autoipd:
  Installed: 0.6.30-3ubuntu1~natty1
  Candidate: 0.6.30-3ubuntu1~natty1
  Version table:
 *** 0.6.30-3ubuntu1~natty1 0
        100 /var/lib/dpkg/status
     0.6.30-0ubuntu2 0
        500 http://fi.archive.ubuntu.com/ubuntu/ natty/main i386 Packages
libdaemon0:
  Installed: 0.14-2
  Candidate: 0.14-2
  Version table:
 *** 0.14-2 0
        500 http://fi.archive.ubuntu.com/ubuntu/ natty/main i386 Packages
        100 /var/lib/dpkg/status
EOS

PolicyOutputWithoutDowngradable = <<EOS
automake:
  Installed: 1:1.11.1-1ubuntu1
  Candidate: 1:1.11.1-1ubuntu1
  Version table:
 *** 1:1.11.1-1ubuntu1 0
        500 http://fi.archive.ubuntu.com/ubuntu/ natty/main i386 Packages
        100 /var/lib/dpkg/status
autotools-dev:
  Installed: 20100122.1
  Candidate: 20100122.1
  Version table:
 *** 20100122.1 0
        500 http://fi.archive.ubuntu.com/ubuntu/ natty/main i386 Packages
        100 /var/lib/dpkg/status
libqt4-dev:
  Installed: 4:4.7.2-0ubuntu6
  Candidate: 4:4.7.2-0ubuntu6
  Version table:
 *** 4:4.7.2-0ubuntu6 0
        500 http://fi.archive.ubuntu.com/ubuntu/ natty/main i386 Packages
        100 /var/lib/dpkg/status
EOS

describe Dgh do
  describe 'parser' do
    it 'parses apt-cache policy output' do
      result = Dgh.parse(PolicyOutputWithDowngradable).content
      result.length.should == 2
      result[0][:name].should == 'avahi-autoipd'
      result[0][:installed_version].should == '0.6.30-3ubuntu1~natty1'
      result[0][:candidate_version].should == '0.6.30-3ubuntu1~natty1'
      result[0][:versions].length.should == 2
    end
  end
end
