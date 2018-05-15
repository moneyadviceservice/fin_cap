RSpec.describe ApplicationHelper do
  before do
    class AnExample
    end

    class AnExamplePresenter < BasePresenter
    end

    class MyPresenter < BasePresenter
    end
  end

  let(:model) { AnExample.new }

  describe '#present' do
    context 'when passing the class' do
      it 'returs the presenter passed in the arguments' do
        expect(
          helper.present(model, MyPresenter)
        ).to be_instance_of(MyPresenter)
      end
    end

    context 'when not passing a block' do
      it 'returns the respective presenter for the object' do
        expect(helper.present(model)).to be_instance_of(AnExamplePresenter)
      end
    end

    context 'when passing a block' do
      it 'yields the respective presenter for the object' do
        helper.present(model) do |presenter|
          expect(presenter).to be_instance_of(AnExamplePresenter)
        end
      end
    end
  end

  describe '#present_collection' do
    subject(:present_collection) do
      helper.present_collection([model])
    end

    it 'returns same size as the collection passed in args' do
      expect(present_collection.size).to be(1)
    end

    it 'returns respective presenter for elements within the collection' do
      expect(present_collection.first).to be_instance_of(AnExamplePresenter)
    end
  end
end
