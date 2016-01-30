require 'spec_helper'
require 'wrandom'

describe 'Array' do
  describe '.respond_to' do
    let(:arr) { Array.new }

    it 'should respond to wsample' do
      arr.respond_to?(:wsample).must_equal true
    end

    it 'should respond to wshuffle' do
      arr.respond_to?(:wshuffle).must_equal true
    end

    it 'should respond to wshuffle!' do
      arr.respond_to?(:wshuffle!).must_equal true
    end
  end

  describe 'when empty array' do
    let(:arr) { [] }

    it 'wsample should return nil' do
      arr.wsample { |v| v }.must_equal(nil)
    end

    it 'wsample(n) should return empty array' do
      arr.wsample(1) { |v| v }.must_equal([])
    end
  end

  describe 'when zero weight' do
    let(:arr) { [0, 1, 2] }

    it 'wsample should not pick' do
      arr.wsample { |v| v }.wont_equal(0)
    end

    it 'wsample(n) should pick as last element' do
      arr.wsample(3) { |v| v }.last.must_equal(0)
    end
  end

  describe '.wshuffle' do
    let(:arr) { [0, 1, 2] }

    it 'wshuffle should return new array' do
      arr.wshuffle { |v| v }.object_id.wont_equal(arr.object_id)
    end

    it 'wshuffle! should return self' do
      arr.wshuffle! { |v| v }.object_id.must_equal(arr.object_id)
    end
  end
end
