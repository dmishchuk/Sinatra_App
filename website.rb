require 'rubygems'
require 'sinatra'

class Stream
	def dosmth
		book = []
		File.foreach("book.txt") do |line| 
			arr = []
			temp = line.split("+38-")
			name = temp[0].strip
			tel = temp[1].sub("000", "093")
			temp_name = name.split
			temp_name.map { |x| x.capitalize! }
			temp_name.each { |x| arr.push(x) }
			arr.push(tel)
			book.push(arr)
		end
		book.sort_by! { |x| x[1] }
	end
end


get '/' do
	item = Stream.new
	@data = item.dosmth
	erb :something
end
