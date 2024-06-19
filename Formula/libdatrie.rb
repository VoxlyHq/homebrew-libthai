class Libdatrie < Formula
  desc "Library This is an implementation of double-array structure for representing trie"
  homepage "https://linux.thai.net/~thep/datrie/datrie.html"
  url "https://github.com/tlwg/libdatrie/releases/download/v0.2.13/libdatrie-0.2.13.tar.xz"
  sha256 "12231bb2be2581a7f0fb9904092d24b0ed2a271a16835071ed97bed65267f4be"
  license "LGPL-2.1-or-later"

  depends_on "pkg-config" => :build
  
  def install
    system "./configure", "--disable-debug",
                           "--disable-dependency-tracking",
                           "--prefix=#{prefix}",
                           "--enable-shared"

    system "make"
    system "make", "install-am"
    system "make", "install-strip" rescue nil # no idea why this needs to be run twice
    system "make", "install"
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