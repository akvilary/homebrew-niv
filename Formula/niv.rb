class Niv < Formula
  desc "Vim-like terminal text editor with LSP and Tree-sitter support"
  homepage "https://github.com/akvilary/niv"
  url "https://github.com/akvilary/niv/archive/refs/heads/main.tar.gz"
  sha256 "fd957a4aa06a32ca01174e42395323afd492c5abe3a8809cb8715462772af0a7"
  version "0.3.0"
  license "MIT"

  depends_on "gcc" => :build
  depends_on "nim" => :build

  resource "tree-sitter" do
    url "https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.26.6.tar.gz"
    sha256 "b4218185a48a791d4022ab3969709e271a70a0253e94792abbcf18d7fcf4291c"
  end

  def install
    (buildpath/"deps/tree-sitter-0.26.6").mkpath
    resource("tree-sitter").stage do
      (buildpath/"deps/tree-sitter-0.26.6").install Dir["*"]
    end

    system "nimble", "build", "-y", "-d:release"
    bin.install buildpath/"niv"
    bin.install buildpath/"niv_json_lsp"
  end

  test do
    assert_predicate bin/"niv", :executable?
    assert_predicate bin/"niv_json_lsp", :executable?
  end
end
