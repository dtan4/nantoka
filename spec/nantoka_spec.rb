require 'spec_helper'

describe Nantoka do
  it "has a version number" do
    expect(Nantoka::VERSION).not_to be nil
  end

  describe "#nantoka" do
    let(:nantoka) do
      Nantoka.nantoka(arg)
    end

    context "nil is given" do
      let(:arg) do
        nil
      end

      it "should raise ArgumentError" do
        expect do
          nantoka
        end.to raise_error ArgumentError
      end
    end

    context "non-String is given" do
      let(:arg) do
        ["a"]
      end

      it "should raise ArgumentError" do
        expect do
          nantoka
        end.to raise_error ArgumentError
      end
    end

    context "noun is given" do
      let(:arg) do
        "システム"
      end

      it "should replace it" do
        expect(nantoka).to eq "なんとか"
      end
    end

    context "compound is given" do
      let(:arg) do
        "テスト駆動開発"
      end

      it "should replace it" do
        expect(nantoka).to eq "なんとか駆動開発"
      end
    end

    context "sentence is given" do
      let(:arg) do
        "飯を食べる"
      end

      it "should replace it" do
        expect(nantoka).to eq "なんとかを食べる"
      end
    end
  end
end
