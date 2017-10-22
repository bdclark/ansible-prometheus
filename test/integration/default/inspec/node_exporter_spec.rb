
describe service('node_exporter') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('9100') do
  it { should be_listening }
  its('processes') { should include 'node_exporter' }
end

describe file('/opt/prometheus/exporters/node_exporter/dist') do
  it { should be_directory }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root') }
  its('mode') { should cmp '0755' }
end

describe file('/opt/prometheus/exporters/node_exporter/current') do
  it { should be_symlink }
end

[
  'collector.cpu',
  'collector.vmstat',
  'no-collector.nfs',
  'no-collector.ntp',
  'collector.filesystem.ignored-fs-types='
].each do |matcher|
  describe command(%(ps aux | grep -E 'node_exporter.* --#{matcher}')) do
    its('exit_status') { should eq 0 }
  end
end
