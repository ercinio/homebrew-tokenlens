cask "tokenlens" do
  version "0.6.0"
  sha256 "da9fb9948649e83ce60de282b1e5667511c345c0eb3f92d584be521e4a52d57e"

  url "https://github.com/ercinio/token-lens/releases/download/v#{version}/TokenLens-#{version}.dmg"
  name "TokenLens"
  desc "AI coding agents in the Mac notch — monitor, approve, answer, and see your whole AI bill"
  homepage "https://ercinio.github.io/tokenlens-site/"

  livecheck do
    url "https://github.com/ercinio/token-lens/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "TokenLens.app"

  # Ad-hoc signed build: clear quarantine so first launch doesn't need right-click ▸ Open.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/TokenLens.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/TokenLens",
    "~/Library/Preferences/com.ercinio.TokenLens.plist",
  ]
end
