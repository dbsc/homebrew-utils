require_relative '../python'

class Rubber < Formula
  include Language::Python::Virtualenv

  desc "Building system for LaTex documents"
  homepage "https://gitlab.com/latex-rubber/rubber"
  url "https://gitlab.com/latex-rubber/rubber/-/archive/1.6.0/rubber-1.6.0.tar.gz"
  sha256 "e0e41b5855c36ffa77c2e45b808462f78e4735a61725a9d40ebe35711836f35b"
  license "GPL-3.0-or-later"
  head "https://gitlab.com/latex-rubber/rubber.git", branch: "master"

  depends_on "python@3.8"
  depends_on "texinfo" => :build
  depends_on :tex

  def install
    venv = virtualenv_create(libexec, "python3.8")
    venv.extend(PythonSetupInstallMethods)

    cd buildpath do
      venv.python_setup_install_and_link
    end
  end
end
