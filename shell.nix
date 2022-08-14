{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/b58ada326aa612ea1e2fb9a53d550999e94f1985.tar.gz") { }
}:
pkgs.mkShell rec {
  buildInputs = with pkgs; [
    pandoc
    tectonic
    # Used by puppeteer shit
    chromium
    nodejs
    yarn
  ];

  shellHook =
    ''
      cd ./node_deps/
      yarn install
      cd ..

      # Environment
      export PUPPETEER_CFG_PATH="puppeteer-config.json"
      export MMDC=./node_deps/node_modules/.bin/mmdc

      # Puppeteer config
      echo "{\"executablePath\": \"$(which chromium)\", \"args\": [\"--no-sandbox\"] }" > ./puppeteer-config.json
    '';
}
