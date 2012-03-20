#!/usr/bin/env ruby

require 'fileutils'
require 'open3'

class App
  def start
    data_files = Dir.glob('data/*.tsv')

    data_files.each do |data_file|
      basename = File.basename(data_file, '.tsv')
    
      gnuplot_commands = Utils.gnuplot_str(data_file)
      image, s = Open3.capture2("gnuplot", :stdin_data=>gnuplot_commands, :binmode=>true)
    
      if s.success?
        STDOUT.binmode; print image
      end
    end
  end
end

class Utils
  def self.gnuplot_str(filename)
    filebase = File.basename(filename, '.tsv')
    <<-HERE .gsub(/^ {2}/, '')
    set terminal png
    set output "#{File.expand_path("graphs/#{filebase}.png")}"
    set title "Benchmark #{filebase}"
    set size 1,1
    set key left top
    set xlabel 'request'
    set ylabel 'ms'
    plot "#{File.expand_path(filename)}" using 10 with lines title 'Benchmark #{filebase}'
    exit
    HERE
  end
end

App.new.start
