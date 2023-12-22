# frozen_string_literal: true

namespace :advent_of_code do
  input_path = Rails.root.join("lib/tasks/advent_of_code/input")

  # ---- Part One
  #
  # rake advent_of_code:day_one\['day_one_sample_input.txt'\]
  # 142
  # rake advent_of_code:day_one\['day_one_input.txt'\]
  # 55971
  #
  # ---- Part Two
  #
  # rake advent_of_code:day_one\['day_one_part_two_sample_input.txt'\]
  # 281
  # rake advent_of_code:day_one\['day_one_sample_input.txt'\]
  # 54699

  desc "Day 1"
  task :day_one, [:file_name] => [:environment] do |_task, args|
    def replace_letters_with_numbers(text)
      replacement_hash = { one: "1", two: "2", three: "3", four: "4", five: "5", six: "6", seven: "7", eight: "8",
                           nine: "9" }
      replacement_hash.each { |k, v| text.gsub! k.to_s, v }
      text
    end

    raise "\nPlease pass in file_name as argmuent.\n\n" if args[:file_name].nil?

    file = "#{input_path}/#{args.file_name}"
    sum = 0
    pattern = /(\d|one|two|three|four|five|six|seven|eight|nine)/
    File.foreach(file) do |line|
      numbers_string = line.scan(pattern).flatten
      first_number = replace_letters_with_numbers(numbers_string.first)
      last_number = replace_letters_with_numbers(numbers_string.last)
      sum += (first_number + last_number).to_i
      puts "#{line.chomp}, #{(first_number + last_number).to_i}"
    end
    puts sum
  end
end
