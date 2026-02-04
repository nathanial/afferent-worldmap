import Lake
open Lake DSL

package «afferent-worldmap» where
  version := v!"0.1.0"

require afferent from git "https://github.com/nathanial/afferent" @ "v0.0.16"
require tileset from git "https://github.com/nathanial/tileset" @ "v0.0.2"
require crucible from git "https://github.com/nathanial/crucible" @ "v0.0.10"

def commonLinkArgs : Array String := #[
  "-framework", "Metal",
  "-framework", "Cocoa",
  "-framework", "QuartzCore",
  "-framework", "Foundation",
  "-framework", "Security",
  "-framework", "SystemConfiguration",
  "-lobjc",
  "-L/opt/homebrew/lib",
  "-L/usr/local/lib",
  "-lfreetype",
  "-lassimp",
  "-lz",
  "-lc++",
  "-lcurl"
]

@[default_target]
lean_lib AfferentWorldmap where
  roots := #[`AfferentWorldmap]

lean_lib Worldmap where
  roots := #[`Worldmap]

lean_lib Tests where
  roots := #[`Tests]

@[test_driver]
lean_exe «afferent-worldmap_tests» where
  root := `Tests.Main
  moreLinkArgs := commonLinkArgs
