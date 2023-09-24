class Charon < Formula
    desc "Interface with the rustc compiler for the purpose of program verification"
    homepage "https://github.com/AeneasVerif/charon"
    url "https://github.com/AeneasVerif/charon/archive/refs/heads/main.zip"
    version "unknown"

    depends_on "rustup"
    depends_on "ocaml"
    depends_on "opam"

    def install
      system "rustup", "install", "stable"
      system "rustup", "default", "stable"
      system "make", "build-charon-rust"

      system "opam", "init", "-a"
      system "opam", "switch", "create", "4.13.1+options"
      system "opam", "install", "ppx_deriving", "visitors", "easy_logging", "zarith", "yojson", "core_unix", "odoc"
      system "make", "build-charon-ml"

      bin.install "bin/charon"
    end

    test do
      system "make", "tests"
    end
  end