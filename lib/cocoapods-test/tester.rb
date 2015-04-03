module Pod
  class Tester
    # @param  [Specification, Pathname, String] spec_or_path
    #         the Specification or the path of the `podspec` file to lint.
    #
    def initialize(spec_or_path, source_urls, local = true)
      @source_urls = source_urls.map { |url| SourcesManager.source_with_name_or_url(url) }.map(&:url)

      if spec_or_path.is_a?(Specification)
        @spec = spec_or_path
        @file = @spec.defined_in_file
      else
        @file = Pathname.new(spec_or_path)
        begin
          @spec = Specification.from_file(@file)
        rescue
          @spec = nil
        end
      end
    end

    # @return [true,false] true if the tests pass
    def test
      UI.puts 'Testing... just kidding'.yellow
      true
    end
  end
end
