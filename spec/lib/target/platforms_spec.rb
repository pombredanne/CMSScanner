require 'spec_helper'

[:WordPress, :PHP].each do |platform|
  describe CMSScanner::Target do
    subject(:target) do
      described_class.new(url).extend(described_class::Platform.const_get(platform))
    end
    let(:url)      { 'http://ex.lo' }
    let(:fixtures) { File.join(FIXTURES, 'target', 'platform', platform.to_s.downcase) }

    it_behaves_like described_class::Platform.const_get(platform)
  end
end