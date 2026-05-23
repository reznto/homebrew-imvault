class Imvault < Formula
  include Language::Python::Virtualenv

  desc "Browse, search, and archive iMessage conversations from macOS"
  homepage "https://github.com/reznto/imvault"
  url "https://github.com/reznto/imvault/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "450570ac35d9a9695274c68ad9684c4bd9d4a4881f45d45d758a1c4a9fdd3007"
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
