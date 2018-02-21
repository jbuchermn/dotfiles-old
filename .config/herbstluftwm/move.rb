#!/usr/bin/ruby

incr, type = ARGV

d = incr.to_i
if type == 'full'
    ch = '.'
else
    ch = ':'
end

array = `herbstclient tag_status 0`.scan(/[:\.\#][^\t]*/)
len = array.length
orig = array.find_index{|e| e[0] == '#'}

i = orig+d
while
    i >= 0 and i < len and array[i][0] == ch
    i = i+d
end

if i != orig and i >= 0 and i < len
    system "herbstclient use_index #{i}"
end
