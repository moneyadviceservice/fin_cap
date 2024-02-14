RSpec.describe LatestNewsTemplatePresenter do
  let(:view) { ActionView::Base.new(ActionView::LookupContext.new(nil), {}, nil) }
  let(:object) { double('BaseTemplate', attributes) }
  let(:attributes) { {} }
  subject(:presenter) { described_class.new(object, view) }

  describe '#hero_colour_css_class' do
    it 'returns the css class to specify the colour' do
      expect(presenter.hero_colour_css_class).to eq('hero--orange')
    end
  end
end
