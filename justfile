default:
	just switch

switch:
	home-manager switch --flake .

clean:
	nix-collect-garbage -d
