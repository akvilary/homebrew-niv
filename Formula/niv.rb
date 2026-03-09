class Niv < Formula
  desc "Vim-like terminal text editor with bundled LSP servers"
  homepage "https://github.com/akvilary/niv"
  url "https://github.com/akvilary/niv/archive/refs/heads/main.tar.gz"
  sha256 "502de6a48baca7bb9edcc0a5b603bebd409bda757153885a9e961114607031cd"
  version "0.5.5"
  license "MIT"

  depends_on "gcc" => :build
  depends_on "nim" => :build

  def install
    system "nimble", "build", "-y", "-d:release"
    bin.install buildpath/"niv"
    bin.install buildpath/"niv_json_lsp"
    bin.install buildpath/"niv_python_lsp"
    bin.install buildpath/"niv_nim_lsp"
    bin.install buildpath/"niv_toml_lsp"
    bin.install buildpath/"niv_yaml_lsp"
    bin.install buildpath/"niv_md_lsp"
    bin.install buildpath/"niv_bash_lsp"
    bin.install buildpath/"niv_css_lsp"
    bin.install buildpath/"niv_html_lsp"
  end

  test do
    assert_predicate bin/"niv", :executable?
    assert_predicate bin/"niv_json_lsp", :executable?
    assert_predicate bin/"niv_python_lsp", :executable?
    assert_predicate bin/"niv_nim_lsp", :executable?
    assert_predicate bin/"niv_toml_lsp", :executable?
    assert_predicate bin/"niv_yaml_lsp", :executable?
    assert_predicate bin/"niv_md_lsp", :executable?
    assert_predicate bin/"niv_bash_lsp", :executable?
    assert_predicate bin/"niv_css_lsp", :executable?
    assert_predicate bin/"niv_html_lsp", :executable?
  end
end
