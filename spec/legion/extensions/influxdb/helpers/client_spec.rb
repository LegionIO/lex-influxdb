# frozen_string_literal: true

RSpec.describe Legion::Extensions::Influxdb::Helpers::Client do
  let(:mock_influx) { instance_double(InfluxDB::Client) }

  before do
    allow(InfluxDB::Client).to receive(:new).and_return(mock_influx)
  end

  describe '.client' do
    it 'uses localhost and port 8086 by default' do
      expect(InfluxDB::Client).to receive(:new).with(nil, hash_including(host: 'localhost', port: 8086, async: false))
      described_class.client
    end

    it 'accepts a custom host' do
      expect(InfluxDB::Client).to receive(:new).with(nil, hash_including(host: 'myhost'))
      described_class.client(host: 'myhost')
    end

    it 'accepts a custom port' do
      expect(InfluxDB::Client).to receive(:new).with(nil, hash_including(port: 9999))
      described_class.client(port: 9999)
    end

    it 'passes the database as the first positional argument' do
      expect(InfluxDB::Client).to receive(:new).with('telegraf', anything)
      described_class.client(database: 'telegraf')
    end

    it 'does not hardcode esphome as the database' do
      expect(InfluxDB::Client).not_to receive(:new).with('esphome', anything)
      described_class.client
    end

    it 'does not hardcode the whonodes hostname' do
      expect(InfluxDB::Client).not_to receive(:new).with(anything, hash_including(host: 'influx.home.whonodes.org'))
      described_class.client
    end
  end
end
