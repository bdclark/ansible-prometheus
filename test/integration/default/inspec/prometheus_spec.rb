
describe service('prometheus') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('9090') do
  it { should be_listening }
end

%w(/etc/prometheus /etc/prometheus/rules).each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_owned_by('root') }
    it { should be_grouped_into('prometheus') }
    its('mode') { should cmp '0755' }
  end
end

describe file('/opt/prometheus/dist') do
  it { should be_directory }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root') }
  its('mode') { should cmp '0755' }
end

describe file('/opt/prometheus/current') do
  it { should be_symlink }
end

describe file('/var/lib/prometheus') do
  it { should be_directory }
  it { should be_owned_by('prometheus') }
  it { should be_grouped_into('prometheus') }
  its('mode') { should cmp '0755' }
end

describe file('/etc/prometheus/prometheus.yml') do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('prometheus') }
  its('mode') { should cmp '0644' }
end

describe file('/etc/prometheus/rules/test.rules.yml') do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('prometheus') }
  its('mode') { should cmp '0644' }
  its('content') { should match('alert: InstanceDown') }
end

[
  'config.file=',
  'storage.tsdb.path=',
  'log.level=info',
].each do |matcher|
  describe command(%(ps aux | grep -E '\/opt\/prometheus\/current\/prometheus .* --#{matcher}')) do
    its('exit_status') { should eq 0 }
  end
end
