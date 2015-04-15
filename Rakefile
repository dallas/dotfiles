$skip_warned = false

task :default do
  # init and update submodules
  puts "Getting submodules"
  puts `git submodule update --init --recursive`

  # Link oh-my-zsh custom files
  puts "Linking oh-my-zsh custom files"
  zsh_dest = File.join(ENV["HOME"], ".dotfiles", "oh-my-zsh", "custom")
  link_files %w[ aliases.zsh projects.zsh ], zsh_dest

  # Link dotfiles
  puts "Linking dotfiles"
  files = Dir["*"].reject { |file|
    %w[ aliases.zsh projects.zsh Rakefile README.md oh-my-zsh ].include?(file)
  }
  link_files files, ENV["HOME"], "."

  puts "", "Run rake with FORCE=true to forcibly overwrite skipped files." if $skip_warned
end

def link_files(files, destination, prefix="")
  force       = ENV["FORCE"] == "true"
  warn_if_any_files_exist_in_destination(files, destination)
  files.each do |file|
    begin
      dest_file = File.join(destination, "#{prefix}#{file}")
      raise StandardError if File.exists?(dest_file)
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
    File.exists? File.join(destination, file)
  }
end

