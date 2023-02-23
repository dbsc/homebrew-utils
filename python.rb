module PythonSetupInstallMethods
  def python_setup_install(args = [])
    @formula.system @venv_root/"bin/python", "setup.py", "install", *args
  end

  def python_setup_install_and_link(args = [], link_manpages: false)
    bin_before = Dir[@venv_root/"bin/*"].to_set
    man_before = Dir[@venv_root/"share/man/man*/*"].to_set if link_manpages

    python_setup_install(args)

    bin_after = Dir[@venv_root/"bin/*"].to_set
    bin_to_link = (bin_after - bin_before).to_a
    @formula.bin.install_symlink(bin_to_link)
    return unless link_manpages

    man_after = Dir[@venv_root/"share/man/man*/*"].to_set if link_manpages
    man_to_link = (man_after - man_before).to_a
    man_to_link.each do |manpage|
      (@formula.man/Pathname.new(manpage).dirname.basename).install_symlink manpage
    end
  end
end
