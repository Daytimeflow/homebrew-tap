cask "codex-touchbar-usage" do
  version "0.3.3"
  sha256 "0e85db2c0a0c6b88f22c397612faf4bf5b1feb5dc92f876c63304ba51055336a"

  url "https://github.com/Daytimeflow/codex-touchbar-usage/archive/refs/tags/v#{version}.tar.gz"
  name "Codex Touch Bar Usage"
  desc "Native Codex quota and token monitor for the MacBook Pro Touch Bar"
  homepage "https://github.com/Daytimeflow/codex-touchbar-usage"

  depends_on macos: :monterey

  installer script: "codex-touchbar-usage-#{version}/scripts/install_touchbar_helper.sh"

  uninstall script: "codex-touchbar-usage-#{version}/scripts/uninstall_touchbar_helper.sh"

  caveats <<~EOS
    The helper is built locally with the installed Swift toolchain, starts automatically at login,
    and appears only while Codex or ChatGPT is focused.
  EOS
end
