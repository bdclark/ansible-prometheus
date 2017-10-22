
describe service('prometheus') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('9090') do
  it { should be_listening }
  its('processes') { should include 'prometheus' }
end

%w(/etc/prometheus /etc/prometheus/rules /opt/prometheus/dist).each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_owned_by('root') }
    it { should be_grouped_into('root') }
    its('mode') { should cmp '0755' }
  end
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
  it { should be_grouped_into('root') }
  its('mode') { should cmp '0644' }
end
