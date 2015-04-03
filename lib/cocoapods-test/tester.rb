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
      unless @spec
        UI.puts "Failed to load #{@spec.name}.".yellow
        return false
      end

      if test_specs.empty?
        UI.puts "There are no test specs in #{@spec.name}.".yellow
        return false
      end

      test_specs.each do |spec|
        UI.puts "Testing #{spec.parent.name}."
      end

      UI.puts "#{@spec.name} passed testing.".green
      true
    end

    private

    def test_specs
      @test_specs ||= [@spec, *@spec.recursive_subspecs].map do |spec|
        spec.test_specification
      end.compact
    end
  end
end
