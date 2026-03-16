# frozen_string_literal: true

RSpec.describe Legion::Extensions::Influxdb::Client do
  let(:mock_influx) { instance_double(InfluxDB::Client) }

  before do
    allow(InfluxDB::Client).to receive(:new).and_return(mock_influx)
  end

  describe '#initialize' do
    it 'stores default options' do
      c = described_class.new
      expect(c.opts).to include(host: 'localhost', port: 8086, database: nil)
    end

    it 'accepts a custom host' do
      c = described_class.new(host: 'influx.example.com')
      expect(c.opts[:host]).to eq('influx.example.com')
    end

    it 'accepts a custom port' do
      c = described_class.new(port: 9999)
      expect(c.opts[:port]).to eq(9999)
    end

    it 'accepts a database name' do
      c = described_class.new(database: 'metrics')
      expect(c.opts[:database]).to eq('metrics')
    end

    it 'stores extra kwargs' do
      c = described_class.new(username: 'admin', password: 'secret')
      expect(c.opts[:username]).to eq('admin')
    end
  end

  describe '#client' do
    it 'delegates to Helpers::Client.client with stored opts' do
      c = described_class.new(host: 'influx.local', port: 8086, database: 'mydb')
      expect(InfluxDB::Client).to receive(:new).with('mydb', hash_including(host: 'influx.local', port: 8086, async: false))
      c.client
    end

    it 'allows per-call overrides' do
      c = described_class.new(host: 'influx.local', database: 'mydb')
      expect(InfluxDB::Client).to receive(:new).with('mydb', hash_including(host: 'other.host'))
      c.client(host: 'other.host')
    end
  end
end
