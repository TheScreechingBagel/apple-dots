# apple-dots &nbsp; [![bluebuild build badge](https://github.com/thescreechingbagel/apple-dots/actions/workflows/build.yml/badge.svg)](https://github.com/thescreechingbagel/apple-dots/actions/workflows/build.yml)

#### "apple dotfiles"

an attempt to make a [ublue-os/aurora-dx](https://github.com/ublue-os/aurora) base image work nicely on a MacBookPro14,2 (2017 macbook pro 13in) - ie wifi firmware/settings, touchbar

largely based on [lauretano/t2-atomic](https://github.com/lauretano/t2-atomic) without the T2 specific bits

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/thescreechingbagel/apple-dots:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/thescreechingbagel/apple-dots:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/thescreechingbagel/apple-dots
```







just gonna dump a bunch of useful-**ish** links for myself here:

https://github.com/lauretano/t2-atomic

https://gist.github.com/almas/5f75adb61bccf604b6572f763ce63e3e  
https://github.com/Dunedan/mbp-2016-linux  
https://github.com/almas/macbook12-spi-driver  - check out if tiny-dfr doesn't work out (or maybe in addition, useful other stuff)  

https://gist.github.com/roadrunner2/1289542a748d9a104e7baec6a92f9cd7

https://github.com/patjak/facetimehd/wiki/Installation#get-started-on-fedora wait wait: https://github.com/ublue-os/akmods/pull/163

https://github.com/davidjo/snd_hda_macbookpro ?

https://gist.github.com/peterychuang/5cf9bf527bc26adef47d714c758a5509?permalink_comment_id=3551297#gistcomment-3551297

https://github.com/lauretano/t2-atomic/blob/main/files/system/etc/systemd/login.conf.d/t2-lidswitch.conf ?

https://github.com/Dunedan/mbp-2016-linux/issues/47#issuecomment-663926000 (and the related mailinglist)

https://gist.github.com/jcberthon/ea8cfe278998968ba7c5a95344bc8b55 - dunno if does much + intending to set rxpower manually, but it's included for now

https://github.com/WhatAmISupposedToPutHere/tiny-dfr/tree/master/etc/systemd/system - maybe tiny-dfr could be easily updated to work on this laptop?

https://github.com/blue-build/modules/pull/376 - have the system folder Do Stuff



no link but: setting the wifi card (`phy0`/`wlp2s0` for me) `rxpower` to 20dBm seems to work pretty well - `sudo iw phy phy0 set txpower limit 2000`


