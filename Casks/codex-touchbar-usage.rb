cask "codex-touchbar-usage" do
  version "0.3.6"
  sha256 "e40895db2bfda37b72e31ad51b59f09465b0dbbb983a8d18d73217191987b70b"

  url "https://github.com/Daytimeflow/codex-touchbar-usage/releases/download/v#{version}/CodexTouchBarUsage-v#{version}-arm64.zip"
  name "Codex Touch Bar Usage"
  desc "Native Codex quota, reset-card, and token monitor for the MacBook Pro Touch Bar"
  homepage "https://github.com/Daytimeflow/codex-touchbar-usage"

  depends_on arch: :arm64
  depends_on macos: :monterey

  installer script: "CodexTouchBarUsage-v#{version}-arm64/install.sh"

  uninstall script: "CodexTouchBarUsage-v#{version}-arm64/uninstall.sh"

  caveats <<~EOS
    This cask installs the prebuilt Apple Silicon helper; Swift is not required.
    The helper starts automatically at login and appears only while Codex or ChatGPT is focused.
  EOS
end
