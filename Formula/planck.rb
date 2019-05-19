class Planck < Formula
  desc "Stand-alone ClojureScript REPL"
  homepage "https://planck-repl.org/"
  url "https://github.com/planck-repl/planck/archive/2.23.0.tar.gz"
  sha256 "b18932d5d6db7b825e0c18edc9f6f268e741bc58890d64ea1dbc81034a275fe4"
  head "https://github.com/planck-repl/planck.git"

  bottle do
    cellar :any
    sha256 "565f3578352fa80a839a32a6b4626cf4a78c5b56077b4dc2204a27eff84713aa" => :mojave
    sha256 "4879e8a83f9814660018504a1fd2a516469d2586885a2f139920153ccc48a731" => :high_sierra
    sha256 "ddb86479a5193daa01615354a89acfbe8a4af5116bfaecfff030da5640644841" => :sierra
  end

  depends_on "clojure" => :build
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on :xcode => :build
  depends_on "icu4c"
  depends_on "libzip"

  def install
    system "./script/build-sandbox"
    bin.install "planck-c/build/planck"
    bin.install "planck-sh/plk"
    man1.install Dir["planck-man/*.1"]
  end

  test do
    assert_equal "0", shell_output("#{bin}/planck -e '(- 1 1)'").chomp
  end
end
