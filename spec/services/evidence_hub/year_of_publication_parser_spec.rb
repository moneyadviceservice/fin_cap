RSpec.describe EvidenceHub::YearOfPublicationParser do
  include ActiveSupport::Testing::TimeHelpers

  describe '.parse' do
    subject(:parser_output) { described_class.parse(year_option) }

    before { travel_to Time.zone.local(2018, 8, 4, 1, 15, 30) }
    after { travel_back }

    context 'when the year option is last 2 years' do
      let(:year_option) { 'Last 2 years' }

      it 'returns last two years' do
        expect(parser_output).to eq([2018, 2017])
      end
    end

    context 'when the year option is last 5 years' do
      let(:year_option) { 'Last 5 years' }

      it 'returns last 5 years' do
        expect(parser_output).to eq([2018, 2017, 2016, 2015, 2014])
      end
    end

    context 'when the year option is more than 5 years ago' do
      let(:year_option) { 'More than 5 years ago' }

      it 'return all years from when Fincap started until 6 years ago' do
        expect(parser_output).to eq(2013.downto(2000).to_a)
      end
    end

    context 'when the year option is all years' do
      let(:year_option) { 'All years' }

      it { is_expected.to be_nil }
    end

    context 'when the year option is anything else' do
      let(:year_option) { '2 million years ago' }

      it { is_expected.to be_nil }
    end
  end
end
