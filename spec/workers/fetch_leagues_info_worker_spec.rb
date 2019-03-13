# frozen_string_literal: true

RSpec.describe FetchLeaguesInfoWorker do
  # speed up test using less mocked response size
  describe '#perform' do
    context 'with clear db' do
      before do
        stub_request(:get, 'https://api.opendota.com/api/leagues').to_return(
          body: file_fixture('webmock/leagues.json').read
        )
      end

      it 'fetches league info and save records' do
        subject.perform

        expect(League.count).to_not be_zero
      end
    end

    context 'with pre saved records' do
      let(:league) { create(:league) }

      before do
        stub_request(:get, 'https://api.opendota.com/api/leagues').to_return(
          body: [league.raw.merge(leagueid: league.id)].to_json
        )
      end

      it "fetches league info and doesn't duplicate records" do
        expect { subject.perform }.to_not(
          change { League.count }
        )
      end
    end
  end
end
