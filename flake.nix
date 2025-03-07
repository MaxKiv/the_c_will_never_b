{
  description = "MaxKiv's Nixos config flake";
  inputs = {
    your-nixos-flake.url = "github:maxkiv/nix";
    nixpkgs.follows = "your-nixos-flake/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem ( system: let
      pkgs = (import nixpkgs) {
        inherit system;
      };
     # Function to create script
     mkScript = name: text: let
       script = pkgs.writeShellScriptBin name text;
     in script;
     
     # Define your scripts/aliases
     scripts = [
       (mkScript "godot" ''godot4 "$@"'')
     ];
    in {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          godot_4
          scons
        ] ++ scripts;
        # Add shell aliases
        shellHook = ''
          alias godot="godot4"
        '';
      };

    });
}
