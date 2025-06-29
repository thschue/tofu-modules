# Changelog

## [1.0.0](https://github.com/thschue/tofu-modules/compare/v0.1.0...v1.0.0) (2025-06-29)


### ⚠ BREAKING CHANGES

* make application values more dynamic

### Features

* add additional admins to cloudkms ([89c96d8](https://github.com/thschue/tofu-modules/commit/89c96d805c707d669a732ab65b6469ea83475023))
* add another role ([8a545fe](https://github.com/thschue/tofu-modules/commit/8a545fe02ffb3bde541dd7b7acaac4c27c053584))
* add another role ([3392344](https://github.com/thschue/tofu-modules/commit/339234456312706ae495ea6224371fb806be5c17))
* add deploy keys ([29c3c18](https://github.com/thschue/tofu-modules/commit/29c3c181d52627f1ce0825e02fc221083d816406))
* add github app installations ([518b49e](https://github.com/thschue/tofu-modules/commit/518b49e792972898ea085ca16fc9fd51049382b9))
* add google cloud kms for openbao ([3e545ff](https://github.com/thschue/tofu-modules/commit/3e545ffc7c356bf656ec1c7a1d4a82a5de461c52))
* add google cloud kms for openbao ([9f314ea](https://github.com/thschue/tofu-modules/commit/9f314eab3fdb921dc980540339cc1e7dc4b34786))
* add google cloud kms for openbao ([6bd01ea](https://github.com/thschue/tofu-modules/commit/6bd01ea60842925ae21ebfb31ba8c03868cd5371))
* add kubelet cert rotation ([cbbb1b7](https://github.com/thschue/tofu-modules/commit/cbbb1b7fee54432c43528cf7c6b550ccc060d290))
* add kubernetes network config for unifi ([843fe8a](https://github.com/thschue/tofu-modules/commit/843fe8ac7f44b01162719f2a26c222593f6449e7))
* add load balancer config ([025f0a2](https://github.com/thschue/tofu-modules/commit/025f0a2bcad6b593d9d0811f167f2a92b1c1250e))
* add outputs for gcpkms ([2331888](https://github.com/thschue/tofu-modules/commit/23318883c7b182915f8ae19304882dcec49fad3d))
* add prep for rook to talos cluster ([aa224ca](https://github.com/thschue/tofu-modules/commit/aa224ca0316cea5cbd1ee30f4df7a7d87ec169e6))
* add project to applications ([fa73bc1](https://github.com/thschue/tofu-modules/commit/fa73bc1f79e750d7fb4f2f993173b2d169ff2f27))
* add server certificate rotation for talos ([3320b82](https://github.com/thschue/tofu-modules/commit/3320b82f038c2154930d76a79257e3c162adf528))
* add server certificate rotation for talos ([bd5cf69](https://github.com/thschue/tofu-modules/commit/bd5cf69fd0437a15ba172e617c79d46800caf3a0))
* add some outputs ([61028a8](https://github.com/thschue/tofu-modules/commit/61028a871102dcd643ca724939fd2b6310f0d8ec))
* change argo connection to http ([a8599ef](https://github.com/thschue/tofu-modules/commit/a8599ef1ecbe37f262e436bcf3920e1c1db7d680))
* change argo to github app ([65bf990](https://github.com/thschue/tofu-modules/commit/65bf9904e3fcc20fda628cce548038c02e907f3d))
* change configuration ([3580481](https://github.com/thschue/tofu-modules/commit/35804811b77472dd97a32e53ce00a12bc49cb4c2))
* change configuration ([04168b3](https://github.com/thschue/tofu-modules/commit/04168b3bc9f70d25ccf7f53e9d6ccd47aaa2df62))
* change helm path ([ab7aef5](https://github.com/thschue/tofu-modules/commit/ab7aef53da09aacf9a94cdcbd7d375dfa1938adb))
* change lifecycle of crypto key ([67fc78f](https://github.com/thschue/tofu-modules/commit/67fc78f51b565b8981dd038212e3d7e1e51f8fef))
* change lifecycle of crypto key ([7259e9e](https://github.com/thschue/tofu-modules/commit/7259e9ef3e0feaa9d7aca3f17d1c46156dadd1f5))
* fix addressing ([4853b65](https://github.com/thschue/tofu-modules/commit/4853b65fbf1d475f47f4b11f2999d425918f92ab))
* fix addressing ([4d80486](https://github.com/thschue/tofu-modules/commit/4d804867e25ba84665531789ca2c092d542be7fa))
* fix addressing ([e718fff](https://github.com/thschue/tofu-modules/commit/e718fff3335ac3c1e115ba18f20981b0c9d5b422))
* fix argocd secret ([b38bd84](https://github.com/thschue/tofu-modules/commit/b38bd84cb131acc74146f4617f18f3fc5eb8fd77))
* fix subnet config ([1882f9e](https://github.com/thschue/tofu-modules/commit/1882f9ef9831a2a33ce43dfc17557a985541c9ad))
* fix subnet config ([9091fdf](https://github.com/thschue/tofu-modules/commit/9091fdfc6a9321ba9ab1d2309cf1934b2b4e3b9f))
* fix subnets ([463eaf4](https://github.com/thschue/tofu-modules/commit/463eaf44cca21a7b9e659fa811afda16f23a771f))
* make application name configurable ([8398451](https://github.com/thschue/tofu-modules/commit/83984517c2e60d06acd94c047e10e9e6025a1a82))
* make application values more dynamic ([bf3bdb0](https://github.com/thschue/tofu-modules/commit/bf3bdb0829364e653654ab0d1de66837d6be0391))
* make ip addressing a bit more static again ([d69cd70](https://github.com/thschue/tofu-modules/commit/d69cd7076408bc40269964bcce4cf046260e7ac0))
* make node sizing configurable ([317e46e](https://github.com/thschue/tofu-modules/commit/317e46ec4787d913ddd48827c80e41b1ff757ba9))
* make talos network config more dynamic ([7f21063](https://github.com/thschue/tofu-modules/commit/7f21063385dad03a30830124d46d9b36d98410a5))
* prevent deletion of kms keys! ([7c38115](https://github.com/thschue/tofu-modules/commit/7c381155ac6bd19e1e8c66e0b13587b9d8cce848))
* remove separate lb network ([e2d32f2](https://github.com/thschue/tofu-modules/commit/e2d32f207abc76e70df5f2368b015d74ae58f217))
* update argo version ([8a32d2d](https://github.com/thschue/tofu-modules/commit/8a32d2d22cd3d19beda16d91f64286b04381999d))
* update kms configuration ([34de320](https://github.com/thschue/tofu-modules/commit/34de320a3827098adb99902e951b523ac0cca194))
* update kms configuration ([6169921](https://github.com/thschue/tofu-modules/commit/61699218a6242f193757d4219ad98ca96d7ec4c3))
* update token variables ([a7b21ec](https://github.com/thschue/tofu-modules/commit/a7b21ec7bfe1269deb7dae42cc99fcc1730e3156))
* update token variables ([44d3452](https://github.com/thschue/tofu-modules/commit/44d34522658ddec6c9acb6aaae0800ac564597c9))
* update token variables ([cd7b230](https://github.com/thschue/tofu-modules/commit/cd7b23039c5555b0e468cfa1535f585732631d68))


### Bug Fixes

* minor issues with tokens ([bb5c795](https://github.com/thschue/tofu-modules/commit/bb5c795e3ab3ea25daa3222d1c813cc949ecf551))

## [0.1.0](https://github.com/thschue/tofu-modules/compare/v0.0.4...v0.1.0) (2025-02-07)


### Features

* add ingress to cilium module ([fe4082b](https://github.com/thschue/tofu-modules/commit/fe4082bf55f6f94c5ca3f46a378c6d8607613021))
* add l2announcements to cilium module ([35db989](https://github.com/thschue/tofu-modules/commit/35db98922aeecb09d52e26ec9c0c8c115a10efd9))

## [0.1.0](https://github.com/thschue/tofu-modules/compare/v0.0.3...v0.1.0) (2025-01-31)


### Features

* add argocd module (first version) and example cluster config ([ac1fca9](https://github.com/thschue/tofu-modules/commit/ac1fca9e3ba44868382084d8f7d84c0c6fa95e36))
* add simple readme ([03021fc](https://github.com/thschue/tofu-modules/commit/03021fc663ed15c08cb56aa13e890cc11558f51b))
* add token for release please ([029af0b](https://github.com/thschue/tofu-modules/commit/029af0bde2394477cd04f31e425d03bf511c0228))
* make network bridges configurable ([00bd69e](https://github.com/thschue/tofu-modules/commit/00bd69ed01820f215f3e2f5beb90560ae6cbb700))


### Bug Fixes

* some formatting ([309c421](https://github.com/thschue/tofu-modules/commit/309c421e839b67b9bea41821d6a44479dda51cf5))

## [0.0.3](https://github.com/thschue/tofu-modules/compare/v0.0.2...v0.0.3) (2025-01-26)


### Features

* change workflow ([95d1f63](https://github.com/thschue/tofu-modules/commit/95d1f63e6b9e11768f335834f3df8b11cf61f338))

## [0.0.2](https://github.com/thschue/tofu-modules/compare/v0.0.1...v0.0.2) (2025-01-26)


### Features

* add devenv and checkov ([2e0a494](https://github.com/thschue/tofu-modules/commit/2e0a49432fe084ca59683e618ca82eda56e584bf))
* add gitleaks ([188bb05](https://github.com/thschue/tofu-modules/commit/188bb05716ca863dafc9374a55b38d48227a4adc))
* add pre-commit and renovate ([b7f3320](https://github.com/thschue/tofu-modules/commit/b7f3320f7c0fcd759345dbffceda4e5f709352d0))
* add talos cluster ([0b4b663](https://github.com/thschue/tofu-modules/commit/0b4b663e89d17c07a0bea7caf3cf060c51cd71b6))
* add version constraint to cilium module ([ede662d](https://github.com/thschue/tofu-modules/commit/ede662d1ad3fd4238ba6ba6697ccb03c8c42fe0a))
* configure release-please ([ee4efb8](https://github.com/thschue/tofu-modules/commit/ee4efb87e2f6dda4f4aaed9946be51a48a3d801f))
* create README if it doesn't exist ([ac09d93](https://github.com/thschue/tofu-modules/commit/ac09d93b0a45a428318f9e345b9d8ef59b00b839))
* fix release please ([98e7552](https://github.com/thschue/tofu-modules/commit/98e7552417263e5b5cc6355b492f3b21046e101d))
* fix release please ([cd09aac](https://github.com/thschue/tofu-modules/commit/cd09aac7266a9bcd9ca15ab02a7be017018a66b8))


### Other

* **deps:** update helm release cilium to v1.16.6 ([064848b](https://github.com/thschue/tofu-modules/commit/064848b128a105aca1318011c455782f7c9559cd))
* **deps:** update terraform proxmox to v0.70.0 ([87063f8](https://github.com/thschue/tofu-modules/commit/87063f809aa52f79ef363436a5e23ee6e2e41d4e))
* **deps:** update terraform talos to v0.7.1 ([2fbed6a](https://github.com/thschue/tofu-modules/commit/2fbed6a08aeaac0062cd582d6669153829259c2d))
