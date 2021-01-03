# Dockerfile
FROM nixos/nix:latest

RUN nix-env -iA nixpkgs.cachix nixpkgs.git
RUN cachix use dapp
COPY ./seth.nix /seth.nix
RUN nix-build /seth.nix

ENTRYPOINT cp /result /host/seth.container
