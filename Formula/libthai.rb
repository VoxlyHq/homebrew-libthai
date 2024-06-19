class Libthai < Formula
  desc "Library providing Thai language support"
  homepage "https://linux.thai.net/projects/libthai"
  url "https://github.com/tlwg/libthai/releases/download/v0.1.29/libthai-0.1.29.tar.xz"
  sha256 "fc80cc7dcb50e11302b417cebd24f2d30a8b987292e77e003267b9100d0f4bcd"
  license "LGPL-2.1-or-later"

  depends_on "libdatrie" => :build
  depends_on "pkg-config" => :build
  
  def install
    system "./configure", "--disable-debug",
                           "--disable-dependency-tracking",
                           "--prefix=#{prefix}",
                           "--enable-shared"
    system "make install-am"
    system "make install-strip"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libthai`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end