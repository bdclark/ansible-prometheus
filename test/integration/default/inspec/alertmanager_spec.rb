
describe service('alertmanager') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('9093') do
  it { should be_listening }
end

%w(/etc/alertmanager /opt/alertmanager/dist).each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_owned_by('root') }
    it { should be_grouped_into('root') }
    its('mode') { should cmp '0755' }
  end
end

describe file('/opt/alertmanager/current') do
  it { should be_symlink }
end

describe file('/var/lib/alertmanager') do
  it { should be_directory }
  it { should be_owned_by('alertmanager') }
  it { should be_grouped_into('alertmanager') }
  its('mode') { should cmp '0755' }
end

describe file('/etc/alertmanager/alertmanager.yml') do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root') }
  its('mode') { should cmp '0644' }
end
