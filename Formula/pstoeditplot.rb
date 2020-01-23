class Pstoeditplot < Formula
  desc "Convert PostScript and PDF files to editable vector graphics"
  homepage "http://www.pstoedit.net/"
  url "https://github.com/mccoyspace/pstoeditplot/archive/v1.0.1.tar.gz"
  sha256 "b7b5d8510b40a5b148f7751268712fcfd0c1ed2bb46f359f655b6fcdc53364cf"

  depends_on "pkg-config" => :build
  depends_on "ghostscript"
  depends_on "imagemagick"
  depends_on "plotutils"

  def install
    ENV.cxx11

    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"pstoedit", "-f", "gs:pdfwrite", test_fixtures("test.ps"), "test.pdf"
    assert_predicate testpath/"test.pdf", :exist?
  end
end
