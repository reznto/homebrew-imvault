class Imvault < Formula
  include Language::Python::Virtualenv

  desc "Browse, search, and archive iMessage conversations from macOS"
  homepage "https://github.com/reznto/imvault"
  url "https://github.com/reznto/imvault/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3de23ae7934c009f2c5b42fada518ff8c56c2689dcab678667f17df03718f539"
  license "MIT"

  depends_on "python@3.12"
  depends_on :macos

  def install
    # Create a virtual environment and install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imvault --version")
  end
end
