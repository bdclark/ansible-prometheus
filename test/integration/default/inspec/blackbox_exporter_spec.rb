
describe service('blackbox_exporter') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('9115') do
  it { should be_listening }
  its('processes') { should include 'blackbox_export' }
end

describe file('/opt/prometheus/exporters/blackbox_exporter/dist') do
  it { should be_directory }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root') }
  its('mode') { should cmp '0755' }
end

describe file('/opt/prometheus/exporters/blackbox_exporter/current') do
  it { should be_symlink }
end

describe file('/etc/prometheus/exporters/blackbox_exporter.yml') do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root') }
  its('mode') { should cmp '0644' }
end
