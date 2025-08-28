#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'

TASKS_FILE = "tasks.txt"

FileUtils.touch(TASKS_FILE) unless File.exist?(TASKS_FILE)

options = {}

OptionParser.new { |option|
    option.banner = "Usage: cli.rb [options]"

    option.on("-aTASK", "--add=TASK", "Add a new task") { |task|
        options[:add] = task
    }

    option.on("-l", "--list", "List all tasks") {
        options[:list] = true
    }

    option.on("-rINDEX", "--remove=INDEX", Integer, "Remove a task by index") { |index|
        options[:remove] = index
    }

    option.on("-h", "--help", "Show help") {
        puts option
        exit
    }
}.parse!

if options[:add]
    File.open(TASKS_FILE, 'a') { |file|
        file.puts(options[:add])
    }
    puts "Task '#{options[:add]}' added."

elsif options[:list]
    tasks = File.readlines(TASKS_FILE, chomp: true)
    if tasks.empty?
        puts "No tasks found."
    else
        tasks.each_with_index { |task, index|
            puts "#{index + 1}. #{task}"
    }
    end

elsif options[:remove]
    tasks = File.readlines(TASKS_FILE, chomp: true)
    index = options[:remove] - 1

    removed = tasks.delete_at(index)

    puts "Task '#{removed}' removed."

end
