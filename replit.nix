{ pkgs }: {
	deps = [
        pkgs.rubyPackages_3_0.rspec-core
        pkgs.ruby
        pkgs.solargraph
        pkgs.rufo
	];
}