
describe service('alertmanager') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('9093') do
  it { should be_listening }
end

%w(/etc/alertmanager /etc/alertmanager/templates).each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_owned_by('root') }
    it { should be_grouped_into('prometheus') }
    its('mode') { should cmp '0755' }
  end
end

describe file('/opt/alertmanager/dist') do
  it { should be_directory }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root') }
  its('mode') { should cmp '0755' }
end

describe file('/opt/alertmanager/current') do
  it { should be_symlink }
end

describe file('/var/lib/alertmanager') do
  it { should be_directory }
  it { should be_owned_by('prometheus') }
  it { should be_grouped_into('prometheus') }
  its('mode') { should cmp '0755' }
end

describe file('/etc/alertmanager/alertmanager.yml') do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('prometheus') }
  its('mode') { should cmp '0644' }
end

describe file('/etc/alertmanager/templates/myorg.tmpl') do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('prometheus') }
  its('mode') { should cmp '0644' }
  its('content') { should match('slack.myorg.text') }
end

[
  'config.file=/etc/alertmanager/alertmanager.yml',
  'storage.path=',
  'log.level=info',
].each do |matcher|
  describe command(%(ps aux | grep '/opt/alertmanager/current/alertmanager .* --#{matcher}')) do
    its('exit_status') { should eq 0 }
  end
end
