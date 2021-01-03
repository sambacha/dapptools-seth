let

  pkgs = import <nixpkgs> {};

  dapptools = import (fetchTarball {
    url = https://api.github.com/repos/dapphub/dapptools/tarball/master;
  }) {};

in pkgs.dockerTools.buildImage {
  name = "seth";
  tag = "latest";

  contents = dapptools.seth;
  config.Cmd = [ "/bin/seth" ];
}
