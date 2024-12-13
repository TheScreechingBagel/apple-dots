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
