require 'pathname'


def does_it_exist(dir)

    localDir = Dir.pwd
    puts localDir
    pn = Pathname.new(localDir+dir.to_s)
    puts pn
    puts pn.exist?()

end

puts does_it_exist("/features/step_definitions")