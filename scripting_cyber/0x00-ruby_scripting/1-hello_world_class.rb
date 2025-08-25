class HelloWorld
    def instance()
        @message = "Hello, World!"
    end
    def print_hello()
        puts instance
    end
end