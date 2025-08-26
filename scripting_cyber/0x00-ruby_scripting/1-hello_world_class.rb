#!/usr/bin/env ruby
class HelloWorld
    def instance()
        @message = "Hello, World!"
    end
    def print_hello()
        puts instance
    end
end