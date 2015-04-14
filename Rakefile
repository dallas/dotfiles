$skip_warned = false

task :default do
  # init and update submodules
  puts "Getting submodules"
  puts `git submodule update --init --recursive`

  # Link dotfiles
  puts "Linking dotfiles"
  files = Dir[".*"].reject { |file|
    next true if file =~ /\.swp\z/
    %w[ . .. .git .gitignore .gitmodules ].include?(file)
  }
  link_files files, ENV["HOME"]

  puts "", "Run rake with FORCE=true to forcibly overwrite skipped files." if $skip_warned
end

def link_files(files, destination)
  force       = ENV["FORCE"] == "true"
  warn_if_any_files_exist_in_destination(files, destination)
  files.each do |file|
    begin
      dest_file = File.join(destination, file)
      FileUtils.ln_s(File.join(FileUtils.pwd, file), dest_file, force: force)
      puts "  Linked #{file} => #{dest_file}"
    rescue StandardError
      puts "  Skipped #{file} (already exists)"
    end
  end
end

def warn_if_any_files_exist_in_destination(files, destination)
  return if $skip_warned
  $skip_warned = files.any? { |file| 
    File.exist? File.join(destination, file)
  }
end

