class Demo

  def get_times(factor)
    return Proc.new {|n| n*factor }
  end

  def proc_from
    Proc.new
  end
end

demo = Demo.new

time1 = demo.get_times(3)
time2 = demo.get_times(4)
puts time1.call(10)
puts time2.call(10)
puts time2.call(time2.call(3))

pro = demo.proc_from{"hello"}
puts pro.call