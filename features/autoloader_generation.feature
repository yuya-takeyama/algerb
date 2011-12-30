Feature: Autoloader generation
  Writing Ruby's Kernel.#autoload by hand is so messy.
  So Algerb generates autoloader file automatically.

  Scenario: Autoloader generation for single file
    Given an empty file named "./lib/foo.rb"
    When I run `algerb`
    Then the output should contain:
    """
    class Autoloader
      def self.register
        Object.module_eval <<-__EOF__
          autoload :Foo, 'foo'
        __EOF__
      end
    end
    """

  Scenario: Autoloader generation for multiple files
    Given an empty file named "./lib/foo.rb"
    And   an empty file named "./lib/bar.rb"
    When I run `algerb`
    Then the output should contain:
    """
    class Autoloader
      def self.register
        Object.module_eval <<-__EOF__
          autoload :Bar, 'bar'
          autoload :Foo, 'foo'
        __EOF__
      end
    end
    """

  Scenario: Autoloader generation for library has nested structure.
    Given an empty file named "./lib/foo.rb"
    And   an empty file named "./lib/foo/bar.rb"
    And   an empty file named "./lib/foo/bar/baz.rb"
    When I run `algerb`
    Then the output should contain:
    """
    class Autoloader
      def self.register
        Object.module_eval <<-__EOF__
          autoload :Foo, 'foo'
          module Foo
            autoload :Bar, 'foo/bar'
            module Bar
              autoload :Baz, 'foo/bar/baz'
            end
          end
        __EOF__
      end
    end
    """
