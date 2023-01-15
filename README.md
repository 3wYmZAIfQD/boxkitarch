# boxkit

A base image and action for Toolbx and Distrobox.

My fork of [boxkit](https://github.com/ublue-os/boxkit) for use on fedora 37. This is a an arch linux image modified to be extensible with any packages I feel necessitates being in my "base" config.

- Adds some quality of life
  - lots of common tools not included in the base arch image `git`, `openssh`, etc...
  - `btop` for process management
  - `python3`
  - some tools that I personally use on the day-today like `mpv`, `nmap`, `sxiv`
- Host Management QoL
  - These are meant for occasional one off commands, not complex workflows
    - Auto symlink the flatpak and podman commands
    - Auto symlink rpm-ostree for Fedora
- Add access to the AUR and the AUR helper yay

## How to use

### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/lcrddtfsot/boxkit -n boxkit
    distrobox enter boxkit
    
If you use toolbx:

    toolbox create -i ghcr.io/lcrddtfsot/boxkit -c boxkit
    toolbox enter boxkit

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/lcrddtfsot/boxkit
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.



## Finding Good Base Images

Of course you can make this however you want, but start with the [Toolbx Community images](https://github.com/toolbx-images/images).
These are a set of mostly-stock images with packages needed to run as a toolbox/distrobox already installed. 
