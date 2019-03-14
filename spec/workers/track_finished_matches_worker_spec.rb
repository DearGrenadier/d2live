# frozen_string_literal: true

RSpec.describe TrackFinishedMatchesWorker do
  # speed up test using less mocked response size
  describe '#perform' do
    before do
      stub_request(:get, "https://api.opendota.com/api/match/#{match.id}").to_return(response)
    end

    context 'with error response' do
      let!(:match) { create(:match, :live) }
      let(:response) do
        {
          status: 404,
          body: { "error": 'Not Found' }.to_json
        }
      end

      it "doesn't update match status" do
        subject.perform
        expect(match.reload.finished).to eq(false)
      end
    end

    context 'with success response' do
      let!(:match) { create(:match, :live) }
      let(:response) do
        {
          status: 200,
          body: file_fixture('webmock/match.json').read
        }
      end

      it 'updates match status' do
        subject.perform
        expect(match.reload.finished).to eq(true)
      end
    end
  end
end
