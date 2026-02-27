class Niv < Formula
  desc "Vim-like terminal text editor with LSP and Tree-sitter support"
  homepage "https://github.com/akvilary/niv"
  url "https://github.com/akvilary/niv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1528f3d3481a1df5ea19c8aec8be2bf1be46d69ab88bcfc5daf684ff7e637373"
  license "MIT"

  depends_on "gcc" => :build
  depends_on "nim" => :build

  def install
    system "nim", "c", "-d:release", "--opt:size", "src/niv.nim"
    bin.install "niv"
  end

  test do
    assert_predicate bin/"niv", :executable?
  end
end
