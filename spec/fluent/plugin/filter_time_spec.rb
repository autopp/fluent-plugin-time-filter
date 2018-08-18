require 'spec_helper'
require 'timecop'

describe Fluent::TimeFilter do
  before { Fluent::Test.setup }

  let(:d) do
    conf = <<~EOCONF
      threshold 60
    EOCONF
    Fluent::Test::FilterTestDriver.new(described_class, 'foo').configure(conf)
  end

  describe '#filter' do
    let(:now) { 1_500_000_000 }

    before { Timecop.freeze(Time.at(now)) }
    after { Timecop.return }

    it 'filters records older than threshold' do
      d.run do
        d.emit({ number: 1 }, now - 61)
        d.emit({ number: 2 }, now - 60)
        d.emit({ number: 3 }, now - 59)
      end

      expect(d.emits).to eq([['foo', now - 60, { number: 2 }], ['foo', now - 59, { number: 3 }]])
    end
  end
end
