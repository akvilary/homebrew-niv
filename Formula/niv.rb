class Niv < Formula
  desc "Vim-like terminal text editor with bundled LSP servers"
  homepage "https://github.com/akvilary/niv"
  url "https://github.com/akvilary/niv/archive/refs/heads/main.tar.gz"
  sha256 "92f11548ccca408ade0b6b922fc4560df988fbc452c5efde999dda55ca2a0256"
  version "0.5.0"
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
