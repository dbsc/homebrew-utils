class MoodleDl < Formula
  include Language::Python::Virtualenv

  desc "Download course content fast from Moodle"
  homepage "https://github.com/dbsc/moodle-dl"
  license "GPL-3.0-or-later"
  head "https://github.com/dbsc/moodle-dl.git", branch: "main"

  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
  end
end
