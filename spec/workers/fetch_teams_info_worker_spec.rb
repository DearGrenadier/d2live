# frozen_string_literal: true

RSpec.describe FetchTeamsInfoWorker do
  # speed up test using less mocked response size
  describe '#perform' do
    context 'with clear db' do
      before do
        stub_request(:get, 'https://api.opendota.com/api/teams').to_return(
          body: file_fixture('webmock/teams.json').read
        )
      end

      it 'fetches teams info and save records' do
        subject.perform

        expect(Team.count).to_not be_zero
      end
    end

    context 'with pre saved records' do
      let(:team) { create(:team) }

      before do
        stub_request(:get, 'https://api.opendota.com/api/teams').to_return(
          body: [team.raw.merge(team_id: team.id)].to_json
        )
      end

      it "fetches league info and doesn't duplicate records" do
        expect { subject.perform }.to_not(
          change { Team.count }
        )
      end
    end
  end
end
