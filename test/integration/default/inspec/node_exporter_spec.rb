
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

describe file('/etc/systemd/system/node_exporter.service') do
  its('content') { should contain(' --collector.cpu') }
  its('content') { should contain(' --collector.vmstat') }
  its('content') { should contain(' --no-collector.nfs') }
  its('content') { should contain(' --no-collector.ntp') }
  its('content') { should contain(' --collector.filesystem.ignored-fs-types="^(sys|proc|auto)fs$"') }
end
