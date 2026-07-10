cask "codex-touchbar-usage" do
  version "0.3.1"
  sha256 "adcc581c5fc57e8b710f9c100f43dff995b60deb2ec793dcad2527827b50e600"

  url "https://github.com/Daytimeflow/codex-touchbar-usage/releases/download/v#{version}/CodexTouchBarUsage-v#{version}-arm64.zip"
  name "Codex Touch Bar Usage"
  desc "Native Codex quota and token monitor for the MacBook Pro Touch Bar"
  homepage "https://github.com/Daytimeflow/codex-touchbar-usage"

  depends_on arch: :arm64
  depends_on macos: :monterey

  installer script: "CodexTouchBarUsage-v#{version}-arm64/install.sh"

  uninstall script: "CodexTouchBarUsage-v#{version}-arm64/uninstall.sh"

  caveats <<~EOS
    The helper starts automatically at login and appears only while Codex or ChatGPT is focused.
  EOS
end
