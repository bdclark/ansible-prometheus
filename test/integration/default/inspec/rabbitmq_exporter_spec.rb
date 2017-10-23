
describe service('rabbitmq_exporter') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('9110') do
  it { should be_listening }
end

describe file('/opt/prometheus/exporters/rabbitmq_exporter/dist') do
  it { should be_directory }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root') }
  its('mode') { should cmp '0755' }
end

describe file('/opt/prometheus/exporters/rabbitmq_exporter/current') do
  it { should be_symlink }
end
