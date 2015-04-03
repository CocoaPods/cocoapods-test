module Pod
  class Command
    class Lib < Command
      class Test < Lib
        self.summary = 'Tests a pod.'
        self.description = <<-DESC
          Tests the Pod using the files in the working directory.
        DESC

        def self.options
          [
            [
              '--sources=https://github.com/artsy/Specs,master',
              'The sources from which to pull dependant pods. Multiple sources must be comma-delimited.'
            ]
          ].concat(super)
        end

        def initialize(argv)
          @source_urls = argv.option('sources', 'https://github.com/CocoaPods/Specs.git').split(',')
          @podspecs_paths = argv.arguments!
          super
        end

        def run
          test_results = podspecs_to_test.map do |podspec|
            Tester.new(podspec, @source_urls).test
          end

          invalid_count = test_results.count { |result| !result }
          if invalid_count > 0
            raise Informative, 'Tests did not pass.'
          end
        end

        private

        def podspecs_to_test
          if !@podspecs_paths.empty?
            Array(@podspecs_paths)
          else
            podspecs = Pathname.glob(Pathname.pwd + '*.podspec{.json,}')
            if podspecs.count.zero?
              raise Informative, 'Unable to find a podspec in the working directory.'
            end
            podspecs
          end
        end
      end
    end
  end
end
