# cocoapods-test

CocoaPods plugin to run tests for a Pod.

## Installation

    $ gem install cocoapods-test

## Usage

Run the tests for a Pod using files in the working directory.

    $ pod lib test POD_NAME

Run the tests for a Pod, downloading the source files.

    $ pod spec test POD_NAME

### Podspecs

To be able to test a Pod, you will need to define ` test_spec` on the Pod
including all the test source files and any test dependencies.

```ruby
Pod::Spec.new do |spec|
  spec.name = 'PathKit'
  spec.version = '1.0.0'
  spec.source_files = 'URITemplate/*.swift'

  spec.test_spec do |test_spec|
    test_spec.source_files = 'URITemplateTests/*.swift'
    test_spec.framework = 'XCTest'
  end
end
````

